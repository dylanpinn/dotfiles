" Use vint as compiler
compiler vint

" LocalLeader s - write file, source it and then apply filetype settings.
noremap <LocalLeader>s :w\|:so %<CR>\|:doautocmd filetypedetect BufRead<CR>
