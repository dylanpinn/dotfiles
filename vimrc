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
Plug 'wakatime/vim-wakatime'              " Wakatime
Plug 'editorconfig/editorconfig-vim'      " EditorConfig
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-dispatch'                 " Async tasks
Plug 'tpope/vim-fugitive'                 " Git manager
Plug 'tpope/vim-vinegar'                  " Improve netrw
Plug 'qpkorr/vim-bufkill'                 " rm bufs w/out closing splits

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Javascript
Plug 'pangloss/vim-javascript'            " improved javascript
Plug 'mxw/vim-jsx'                        " improved JSX
Plug 'digitaltoad/vim-pug'                " pug syntax

" Ruby
Plug 'vim-ruby/vim-ruby'                  " update ruby syntax
Plug 'tpope/vim-rails'                    " improve editing rails apps
Plug 'thoughtbot/vim-rspec'               " rspec runner

" Terminal/Tmux
Plug 'wincent/terminus'                   " improved terminal
Plug 'tmux-plugins/vim-tmux-focus-events' " Fix vim focus events inside tmux

" Theme
Plug 'nanotech/jellybeans.vim'
call plug#end()

""" Colours

colorscheme jellybeans
let g:jellybeans_use_term_italics = 1  " enable italics

""" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

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

"" File finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

"" Buffer finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

"" Tag finder
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

"" Project finder
nmap <Leader>a :Ag<Space>

" Run make
nnoremap <leader>m :Make<cr>
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Rename Current File
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

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

""" Misc

set autoread                        " read file changes
set directory=~/.vim/swapfiles//    " don't store swap files in cur dir

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
