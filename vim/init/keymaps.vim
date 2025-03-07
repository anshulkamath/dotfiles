" Keymaps

" Searching
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr> " clear search

" Quick Source
nnoremap <leader>so :source ~/.vim/vimrc<cr>

map <leader>y "+y
map <leader>Y V"+y

" Fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :Rg<cr>

" Redraw
nnoremap <leader>r :redraw!<cr>

" Open Project View
nnoremap <leader>pv :Ex<cr>

" Split View
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sh :hsplit<cr>
