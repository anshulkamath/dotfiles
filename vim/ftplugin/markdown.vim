" Honor sembr recommendations: https://sembr.org
setlocal textwidth=80
setlocal colorcolumn=80

" fo=n uses formatlistpat to indent ALL continuation lines of a list item.
" Vim's built-in markdown ftplugin sets comments=fb:*,fb:-,fb:+ where the 'f'
" flag means "first line only" — that's why only the first continuation gets
" the 2-space indent. Clearing list markers from comments and relying solely
" on fo=n + formatlistpat fixes all wrapped lines.
setlocal formatoptions+=n
setlocal formatoptions-=c
let &l:formatlistpat = '^\s*[-*+]\s\+\|^\s*\d\+[.)]\s\+'
setlocal comments=n:>
setlocal autoindent

