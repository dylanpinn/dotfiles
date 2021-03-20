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

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Switch syntax highlighting on.
syntax on
