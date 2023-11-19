return {
	"tpope/vim-fugitive",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>gc", ":GBrowse!<cr>", { desc = "Copy remote URL to clipboard" })
		keymap.set("v", "<leader>gc", ":'<'>GBrowse!<cr>", { desc = "Copy remote URL to clipboard" })
	end,
}
