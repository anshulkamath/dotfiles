vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 35,
				preserve_window_proportions = true,
			},
			renderer = {
				group_empty = true,
				icons = { git_placement = "before" },
			},
			filters = { dotfiles = false },
			git = {
				enable = true,
				show_on_dirs = false,
				timeout = 200,
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 100,
			},
			diagnostics = { enable = false },
			actions = {
				open_file = { quit_on_open = false },
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Reveal file in explorer" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh explorer" })
	end,
}
