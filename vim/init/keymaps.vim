" Keymaps

" Searching
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr> " clear search

" Quick Source
nnoremap <leader>so :source ~/.vim/vimrc<cr>

" Fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :Rg<cr>
