""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" Colours {{{
if !empty($COLORTERM)
  set termguicolors " Enable 24-bit colours in terminal vim (if supported).
endif
colorscheme apprentice " https://github.com/romainl/Apprentice
" }}}

" Misc {{{
set hidden " Possibility to have more than one unsaved buffer.

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
" }}}

" Spaces & Tabs {{{
set tabstop=2       " Number of visual spaces per TAB.
set softtabstop=2   " Number of spaces in tab when editing.
set expandtab       " Tabs are spaces.
set shiftwidth=2    " Number of spaces when visual indenting.
" }}}

" UI Layout {{{
set number " Show line numbers.
" }}}

" Searching {{{
set ignorecase " Ignore case when searching.
set smartcase  " Ignore case unless CAPS.
set hlsearch   " Highlight matches.

" Ignore tag files
set wildignore+=tags,tags.*
" Allow expanding wildmenu.
set wildcharm=<C-z>
" Remove unused directory from path.
set path-=/usr/include
" }}}

" Folding {{{
" }}}

" Status Line {{{
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
" }}}

" Keybindings {{{
" leader
let mapleader=","

" Fuzzy searching using wildmenu.
nnoremap <Leader>e :edit **/*<C-z><S-Tab>
nnoremap <Leader>f :find **/*<C-z><S-Tab>
" }}}

" # vim: set syntax=vim:
