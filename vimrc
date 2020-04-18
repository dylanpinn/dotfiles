""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

set hidden                     " Possibility to have more than one unsaved
                               " buffers.
set number                     " Show line numbers.

" Spacing
set shiftwidth=2               " Set tabwidth to 2 spaces.
let &softtabstop = &shiftwidth " Set softtabs to same as shiftwidth.
set expandtab                  " Use spaces instead of tabs.

" Colours
if !empty($COLORTERM)
  set termguicolors " Enable 24-bit colours in terminal vim (if supported).
endif

colorscheme apprentice " https://github.com/romainl/Apprentice

" leader
let mapleader=","

" Searching {
set ignorecase " Ignore case when searching.
set smartcase  " Ignore case unless CAPS.
set hlsearch   " Highlight matches.

set wildcharm=<C-z>
nnoremap <Leader>e :e **/*<C-z><S-Tab>
" }

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

""" Status Line
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
