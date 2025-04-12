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

" Fzf
let $FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
