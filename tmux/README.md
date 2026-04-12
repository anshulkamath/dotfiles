# tmux config

Prefix is `ctrl+a`.

---

## Popup / scratch sessions

Popups open floating tmux sessions — `new-session -A -s <name>` means they
persist between invocations. Detach with `prefix + d` to keep state; exit the
shell to destroy. Since they're real sessions, `prefix + s` shows them in the
session list, and you can switch into them as full windows anytime.

| Binding       | Session name   | Directory                              | Command |
|---------------|----------------|----------------------------------------|---------|
| `prefix + g`  | `scratch`      | current pane path                      | zsh     |
| `prefix + G`  | `git`          | current pane path                      | zsh     |

### Promoting a popup to a full session

The popup is already a first-class tmux session. To "promote" it:
1. Detach from the popup (`prefix + d`)
2. Switch to it: `prefix + s`, or `tmux switch-client -t <session-name>`

---

## Project switcher — `ctrl+]` (prefix2)

Quick-jump to project directories as floating sessions.

| Binding          | Session name | Directory                            |
|------------------|--------------|--------------------------------------|
| `ctrl+] → N`     | `notes`      | `~/Developer/personal/notes`         |
| `ctrl+] → .`     | `dotfiles`   | `~/Developer/public/dotfiles`        |

---

## Claude project switcher — `ctrl+\`

Same as above, but opens with `claude` running in the session. On first open
it starts a fresh Claude Code session; subsequent opens reattach to the
existing one (preserving conversation context).

| Binding          | Session name     | Directory                            |
|------------------|------------------|--------------------------------------|
| `ctrl+\ → N`     | `notes-claude`   | `~/Developer/personal/notes`         |
| `ctrl+\ → .`     | `dotfiles-claude`| `~/Developer/public/dotfiles`        |

---

## Pane management

| Binding           | Action                          |
|-------------------|---------------------------------|
| `prefix + \|`     | Split horizontal                |
| `prefix + -`      | Split vertical                  |
| `prefix + h/j/k/l`| Resize pane (repeatable)        |
| `prefix + m`      | Zoom/unzoom pane                |
| `prefix + !`      | Break pane into its own window  |
| `ctrl+h/j/k/l`    | Navigate panes (vim-tmux-navigator) |

To pull a pane from another window into the current one:
```
prefix + : join-pane -s <window-index>
```

---

## Session management

| Binding           | Action                          |
|-------------------|---------------------------------|
| `prefix + s`      | Interactive session + window tree |
| `prefix + $`      | Rename current session          |
| `prefix + d`      | Detach (session stays alive)    |
| `prefix + I`      | Install TPM plugins             |
| `prefix + r`      | Reload config                   |

Sessions survive reboots via `tmux-resurrect` (`prefix + ctrl+s` to save,
`prefix + ctrl+r` to restore). Auto-restore is disabled — save manually before
shutting down.

---

## Copy mode

| Binding           | Action                     |
|-------------------|----------------------------|
| `prefix + [`      | Enter copy mode            |
| `v`               | Begin selection            |
| `y`               | Copy selection to clipboard |
| `ctrl+space`      | Send `ctrl+l` (clear)      |
