" Vim script

compiler vint

" Wrap text at 80 chars.
setlocal textwidth=80

" Show column at 80 width.
if exists('+colorcolumn')
  setlocal colorcolumn=80
endif

" Fold vimrc and config files.
setlocal foldmethod=marker
setlocal foldlevel=0
