return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({ delay = 400 })
		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>e", group = "explorer" },
			{ "<leader>f", group = "find" },
			{ "<leader>j", group = "jj" },
			{ "<leader>m", group = "format" },
			{ "<leader>r", group = "rename/restart" },
			{ "<leader>s", group = "splits" },
			{ "<leader>x", group = "diagnostics" },
		})
	end,
}
