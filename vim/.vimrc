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

" Move swap files to a dedicated directory, rather than the default of the
" same directory as the source file. This directory is created by
" `install-vim` in the Makefile.
"
" Add two trailing slashes to the path to tell Vim to use the full escaped
" path of the file to avoid collisions.
"
set directory=$XDG_CACHE_HOME/vim/swap//

" Keep track of undo history for files between sessions. This ensures that
" undo and redo are available between Vim invocations. These files are kept in
" a cache directory. This directory is created by `install-vim` in the
" Makefile.
"
" Add two trailing slashes to the path to tell Vim to use the full escaped
" path of the file to avoid collisions.
"
set undofile
set undodir=$XDG_CACHE_HOME/vim/undo//

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
"
filetype plugin indent on

" When checking spelling, use Australian English by default.
"
set spelllang=en_au

" Vim includes defaults for comments and path that date back to its history as
" a mainly C development environment. Removing these values allows us to use
" filetype plugins to set them as needed.
"
set comments= commentstring= define= include=
set path-=/usr/include

" Switch syntax highlighting on.
syntax on
