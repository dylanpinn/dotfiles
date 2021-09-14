" Define extra filetype options here.
"
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd! BufRead,BufNewFile
        \ */git/config
        \ setfiletype gitconfig
  autocmd! BufRead,BufNewFile
        \ .bash_profile
        \,.profile
        \,bash_profile
        \,profile
        \ setfiletype sh
augroup END
