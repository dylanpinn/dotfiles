" Use vint as the compiler.
compiler vint

"" LocalLeader,s write file, source it and then apply filetype settings.
noremap <LocalLeader>s
      \ :w\|:so %<CR>\|:doautocmd filetypedetect BufRead<cr>
