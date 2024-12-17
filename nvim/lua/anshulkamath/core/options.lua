vim.g.mapleader = " "

local opt = vim.opt

-- default spacing
opt.tabstop = 8
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- line numbering
opt.nu = true
opt.relativenumber = true

-- turn off vim backups and default to undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undolevels = 1000
opt.undofile = true

-- turn off search highlighting
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.termguicolors = true
opt.ttyfast = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"
