" Indicate if line is longer than 80 characters.
"
setlocal textwidth=80
setlocal colorcolumn=+0

" Use shfmt (if present) to format shell files.  This uses the same
" configuration as the format-sh in top-level dotfiles.
" Exceptions:
"  - indent to same width as what Vim uses for the current filetype.
"  - simplify the code.
if executable('shfmt')
  let &l:formatprg='shfmt -i ' . &l:shiftwidth . ' -ln posix -s'
endif
