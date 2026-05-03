return {
	"evanphx/jjsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("jjsigns").setup({
			attach = { auto = true },
			signcolumn = true,
			base = "@-",
			update_debounce = 100,
		})

		vim.keymap.set("n", "<leader>jt", "<cmd>JjSigns toggle<CR>", { desc = "Toggle jj signs" })
	end,
}
