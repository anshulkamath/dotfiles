local dap = require('dap')
local dap_go = require('dap-go')

vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<leader>dsv', function() dap.step_over() end)
vim.keymap.set('n', '<leader>dsi', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dso', function() dap.step_out() end)
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dro', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>drl', function() dap.run_last() end)
vim.keymap.set('n', '<leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

vim.keymap.set('n', '<leader>dgt', function() dap_go.debug_test() end)
vim.keymap.set('n', '<leader>dgl', function() dap_go.debug_last() end)

dap_go.setup()