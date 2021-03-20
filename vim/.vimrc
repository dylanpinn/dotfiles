""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" Move the viminfo file out of the $HOME directory. A logical place would be
" $XDG_CACHE_HOME (typically $HOME/.cache/).
"
" This file will only be created if this directory exists, so this is handled
" in the `install-vim` part of the Makefile.
"
set viminfofile=$XDG_CACHE_HOME/vim/viminfo

" Vim saves a history of `:` commands and search history in the viminfo file.
" By default this is set to 50. 200 is a better value to ensure that we are
" not losing any useful commands or search history.
"
set history=200

" Enable automatic backups before overwriting a file and leave it around after
" the file has been written.
"
" We will also want to move these backup files to the $XDG_CACHE_HOME
" directory. This directory is created by the `install-vim` in the Makefile.
"
" The double trailing slashes will tell Vim to use the full escaped path of
" the file to avoid collisions.
"
set backup
set backupdir=$XDG_CACHE_HOME/vim/backup//

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Switch syntax highlighting on.
syntax on
