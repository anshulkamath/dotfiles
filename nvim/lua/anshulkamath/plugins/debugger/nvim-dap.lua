return {
	"mfussenegger/nvim-dap",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
		keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
		keymap.set("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Next (step over)" })
		keymap.set("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
		keymap.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
		keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "Open Repl" })
	end,
}
