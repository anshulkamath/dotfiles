return {
	"tpope/vim-rhubarb",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>gb", "<cmd>GBrowse<cr>", { desc = "Open file in remote repo" })
		keymap.set("v", "<leader>gb", "<cmd><'>'GBrowse<cr>", { desc = "Open lines in remote repo" })
		keymap.set("n", "<leader>gy", "<cmd>GBrowse!<cr>", { desc = "Copy remote link to clipboard" })
		keymap.set("v", "<leader>gy", "<cmd>'<,'>GBrowse!<cr>", { desc = "Copy remote link to clipboard" })
	end,
}
