return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				yaml = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format file or range" })
	end,
}
