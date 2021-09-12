" Define extra filetype options here.
"
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd! BufRead,BufNewFile */git/config        setfiletype gitconfig
  autocmd! BufRead,BufNewFile .profile,profile  setfiletype sh
augroup END
