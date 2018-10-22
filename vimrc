""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

""" Plugins

" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-sensible'                 " sensible defaults
Plug 'tpope/vim-surround'                 " quoting/paraenthese easier
Plug 'ajh17/VimCompletesMe'               " smarter completion
Plug 'wakatime/vim-wakatime'              " wakatime
Plug 'tpope/vim-commentary'               " Comment stuff out	

" Javascript
Plug 'pangloss/vim-javascript'            " improved javascript
Plug 'mxw/vim-jsx'                        " improved JSX

" Terminal/Tmux
Plug 'wincent/terminus'         " improved terminal

" Theme
Plug 'nanotech/jellybeans.vim'
call plug#end()

""" Colours

colorscheme jellybeans
let g:jellybeans_use_term_italics = 1  " enable italics

""" Spaces & Tabs

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " number of spaces when visual indenting

""" Bindings

" leader
let mapleader=","

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quickly switch between last used buffers	
nnoremap <leader><leader> <c-^>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" getting around

" edit a file
nnoremap <leader>e :e **/
" buff list
nnoremap <leader>b :b <C-d>

""" Searching

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set smartcase           " ignore case unless CAPS
set hlsearch            " highlight matches

" Improve the built in grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""" Splits	

set splitbelow      "New splits below, not above
set splitright      "New splits on the right, not left

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
