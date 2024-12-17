" Keymaps

" Syntax highlighting
syntax on

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Vertical splits should open below
set splitbelow

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Line numbering
set nu rnu

" Turn off startup message
set shortmess+=I

" Allow to scroll off the buffer a little
set scrolloff=5

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Persistent undo
set undofile
set undodir=$HOME/.vim/undodir
set undolevels=1000
set undoreload=10000
