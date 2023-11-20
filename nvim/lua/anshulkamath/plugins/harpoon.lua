return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")

		keymap.set("n", "<leader>eh", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })
		keymap.set("n", "<leader>hm", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "]h", ui.nav_next, { desc = "Go to next harpoon mark" })
		keymap.set("n", "[h", ui.nav_prev, { desc = "Go to previous harpoon mark" })
	end,
}
