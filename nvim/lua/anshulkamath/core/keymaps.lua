local keymap = vim.keymap

-- use jj to exit insert mode
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- open project view
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open project view" })

-- allow for clean movement of lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down" })

-- cursor stays in middle when paging up/down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up with centered cursor" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down with centered cursor" })

-- cursor stays in middle when searching for terms
keymap.set("n", "n", "nzzzv", { desc = "Find next match with centered cursor" })
keymap.set("n", "N", "Nzzzv", { desc = "Find previous match with centered cursor" })

-- yank into system clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank selection into system clipboard" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line into system clipboard" })

-- don't ever press Q. honestly. it's the worst place in the universe
keymap.set("n", "Q", "<nop>")

-- quick source
keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Quick source" })

-- toggle background
keymap.set("n", "<leader>b", ":TransparentToggle<CR>", { desc = "Toggle transparent background" })

-- remap visual block (lost for some reason?)
keymap.set("n", "<C-v>", "<C-q>", { desc = "Remap visual block (lost for some reason?)" })

-- automatic chmod
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Quick chmod +x" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
