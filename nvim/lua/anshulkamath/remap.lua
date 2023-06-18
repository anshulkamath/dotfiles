local tmuxPrefix = '<C-a>'
-- open project view
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- allow for clean movement of lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- joining lines keeps cursor focus
vim.keymap.set('n', 'J', 'mzJ`z')

-- cursor stays in middle when paging up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- cursor stays in middle when searching for terms
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- pastes register without clobbering
vim.keymap.set('x', '<leader>p', [['_dP]])

-- yank into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- quick create new session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- don't ever press Q. honestly. it's the worst place in the universe
vim.keymap.set('n', 'Q', '<nop>')

-- quick replace
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader><leader>', function() vim.cmd('so') end)

-- toggle background
vim.keymap.set('n', '<leader>b', ':TransparentToggle<CR>')

-- toggle nvim tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- remap visual block (lost for some reason?)
vim.keymap.set('n', '<C-v>', '<C-q>')

-- quick quit
vim.keymap.set('n', '<leader>q', ':wq<CR>')
