vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gd', ':Gdiff !~1<CR>')
vim.keymap.set('n', '<leader>gds', function () vim.cmd("Gvdiffsplit") end)
vim.keymap.set('n', '<leader>gb', function () vim.cmd("Git blame") end)
