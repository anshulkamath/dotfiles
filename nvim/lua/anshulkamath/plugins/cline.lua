return {
	"yetone/avante.nvim",
	version = false,
	build = "make",
	event = "VeryLazy",
	opts = {
		provider = "cline",
		acp_providers = {
			cline = {
				command = "cline",
				args = { "--acp" },
			},
		},
		mappings = {
			ask = "<leader>aa",
			edit = "<leader>ae",
			refresh = "<leader>ar",
			toggle = {
				default = "<leader>at",
			},
		},
		hints = { enabled = false },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}
