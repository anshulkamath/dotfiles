return {
	"mfussenegger/nvim-dap",
	name = "nvim-dap",
	config = function()
		local vscode_ext = require("dap.ext.vscode")
		vscode_ext.load_launchjs(nil, {})

		-- keymaps
		vim.api.nvim_set_keymap('n', '<leader>dc', '<Cmd>lua require"dap".continue()<CR>', { desc = "[DEBUGGER] Continue" })
		vim.api.nvim_set_keymap('n', '<leader>dso', '<Cmd>lua require"dap".step_over()<CR>', { desc = "[DEBUGGER] Step over" })
		vim.api.nvim_set_keymap('n', '<leader>dsi', '<Cmd>lua require"dap".step_into()<CR>', { desc = "[DEBUGGER] Step into" })
		vim.api.nvim_set_keymap('n', '<leader>dS', '<Cmd>lua require"dap".step_out()<CR>', { desc = "[DEBUGGER] Step out" })
		vim.api.nvim_set_keymap('n', '<leader>db', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = "[DEBUGGER] Toggle breakpoint" })
		vim.api.nvim_set_keymap('n', '<leader>dB', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { desc = "[DEBUGGER] Set conditional breakpoint" })
		vim.api.nvim_set_keymap('n', '<leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', { desc = "[DEBUGGER] Open REPL" })
		vim.api.nvim_set_keymap('n', '<leader>dl', '<Cmd>lua require"dap".run_last()<CR>', { desc = "[DEBUGGER] Run last" })
		vim.api.nvim_set_keymap('n', '<leader>du', '<Cmd>lua require"dapui".toggle()<CR>', { desc = "[DEBUGGER] Toggle UI" })

	end
}
