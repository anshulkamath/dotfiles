-- nvim-treesitter `main` branch (the rewrite). Required for Neovim 0.11+.
-- API differs from `master`: no setup() with `ensure_installed`, no
-- incremental_selection. Parsers are installed via TS.install(), highlight is
-- started per-buffer via vim.treesitter.start().
local PARSERS = {
	"bash",
	"c",
	"dockerfile",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"regex",
	"sql",
	"toml",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(PARSERS)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					if not lang then
						return
					end
					if pcall(vim.treesitter.start, args.buf, lang) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
				move = { set_jumps = true },
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")

			local function s(query)
				return function()
					select.select_textobject(query, "textobjects")
				end
			end
			vim.keymap.set({ "x", "o" }, "af", s("@function.outer"), { desc = "around function" })
			vim.keymap.set({ "x", "o" }, "if", s("@function.inner"), { desc = "inside function" })
			vim.keymap.set({ "x", "o" }, "ac", s("@class.outer"), { desc = "around class" })
			vim.keymap.set({ "x", "o" }, "ic", s("@class.inner"), { desc = "inside class" })
			vim.keymap.set({ "x", "o" }, "aa", s("@parameter.outer"), { desc = "around argument" })
			vim.keymap.set({ "x", "o" }, "ia", s("@parameter.inner"), { desc = "inside argument" })

			local function jump(fn, query)
				return function()
					fn(query, "textobjects")
				end
			end
			vim.keymap.set(
				{ "n", "x", "o" },
				"]f",
				jump(move.goto_next_start, "@function.outer"),
				{ desc = "next function" }
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				"[f",
				jump(move.goto_previous_start, "@function.outer"),
				{ desc = "prev function" }
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				"]F",
				jump(move.goto_next_end, "@function.outer"),
				{ desc = "next function end" }
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				"[F",
				jump(move.goto_previous_end, "@function.outer"),
				{ desc = "prev function end" }
			)
			vim.keymap.set({ "n", "x", "o" }, "]c", jump(move.goto_next_start, "@class.outer"), { desc = "next class" })
			vim.keymap.set(
				{ "n", "x", "o" },
				"[c",
				jump(move.goto_previous_start, "@class.outer"),
				{ desc = "prev class" }
			)
		end,
	},
}
