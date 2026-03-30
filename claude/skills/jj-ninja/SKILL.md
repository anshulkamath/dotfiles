---
name: jj-ninja
description: Use when the user wants to apply fixes or changes to specific jj revisions. Handles the workflow of creating empty revisions, making changes, and squashing into target revisions. Triggers on phrases like "squash into revision", "fix revision", "apply to rev", "jj squash", or when the user wants to edit historical jj revisions without checking them out.
version: 1.2.0
---

# jj-ninja

Workflows for common jj (Jujutsu) version control operations.

## Flow: Create a Megamerge Revision

Create an empty working copy that is a descendant of a set of revisions, so you can see and edit files from all of them.

### When to use

- Before squashing changes into multiple revisions on different branches.
- Any time you need a single working copy that contains the combined state of several leaf revisions.

### Workflow

1. **Identify the leaf revisions.** These are the tips of each branch you need to reach. For example, if target revisions are `tz` and `wx` on one branch and `pu` on another, the leaves are `wx` (descendant of `tz`) and `pu`.

2. **Check current state:**

   ```bash
   jj diff --stat
   jj log --limit 5 -r 'ancestors(@)'
   ```

3. **Create the megamerge.** Pass all leaf revisions as parents:

   ```bash
   jj new <leaf1> <leaf2> ...
   ```

   This creates an empty revision whose parents are the given leaves, and checks it out as the working copy.

4. **Verify** the working copy is empty and has the right parents:

   ```bash
   jj diff --stat
   jj log -r @ -T 'description'
   ```

## Flow: Squash Changes into Target Revisions

Apply changes to specific historical revisions without editing them directly.

### Prerequisite

The working copy must be an empty revision that is a descendant of all target revisions. If it isn't, follow the **Create a Megamerge Revision** flow first.

### Workflow

1. **Make all edits in the working copy.** Edit files normally using the Edit/Write tools.

2. **Squash each file (or set of files) into its target revision:**

   ```bash
   jj squash --into <rev> -m "$(jj log -r <rev> -T description --no-graph)" -- <file1> <file2> ...
   ```

   - Always pass `-m` with the original revision's description to avoid opening an interactive editor.
   - Use `--keep-emptied` if the working copy revision should be preserved even if it becomes empty.
   - Specify explicit file paths after `--` to squash only the relevant files.

3. **When changes span multiple revisions**, squash files one revision at a time. Each `jj squash` rebases descendants automatically.

4. **Verify** each squash landed correctly:

   ```bash
   jj diff -r <rev> -- <file1> | head -30
   ```

### Rules

- **Never use `jj edit`** to check out a target revision. Always work from the current revision and squash.
- **Never use interactive flags** (`-i`) — they require terminal input that isn't supported.
- **Always pass `-m`** with the original description when squashing to avoid vim opening.
- **One revision at a time** — squash files for one target revision before moving to the next, since each squash rebases descendants and may change commit IDs.

## Flow: Fix GitHub PRs from Review Comments

Given a set of PR numbers, read the review comments, apply fixes, and squash each fix into its corresponding jj revision.

### Workflow

1. **Determine the GitHub repo.** Get the remote URL:

   ```bash
   jj git remote list
   ```

   Extract the `owner/repo` from the origin URL.

2. **Fetch review comments for each PR.** Use the GitHub API to pull issue-level comments (where Claude bot posts reviews):

   ```bash
   gh api "repos/<owner>/<repo>/issues/<pr>/comments" \
     --jq '.[] | select(.user.login == "claude[bot]") | .body'
   ```

   Do this for every PR in the given range. Skip comments that are purely security reviews with no actionable findings.

3. **Map PRs to jj revisions.** List the revision history and match each PR's title/description to a revision:

   ```bash
   jj log --limit 20 -r 'ancestors(@)' --no-graph \
     -T 'change_id.shortest() ++ " " ++ commit_id.shortest() ++ " " ++ description.first_line() ++ "\n"'
   ```

   Build a table: `PR # → revision change ID → actionable comments`.

4. **Triage comments.** For each PR, classify every comment as:
   - **Actionable** — a concrete code change is needed.
   - **False positive** — the comment is wrong or already addressed (e.g. it claims a prop is unused but it is used). Skip these.
   - **Question** — the comment asks for clarification, not a code change. Flag to the user.

   Present the triage table to the user before proceeding.

5. **Create a megamerge revision** using the **Create a Megamerge Revision** flow. The leaves should be the tip revisions of all branches containing target revisions.

6. **Apply fixes, one PR at a time.** For each PR (in chronological order):
   - Make the edits in the working copy.
   - Squash the changed files into the PR's revision using the **Squash Changes into Target Revisions** flow.
   - Verify the squash landed correctly before moving to the next PR.

7. **Report results.** Summarize what was fixed per PR and flag any comments that were skipped or need user input.
