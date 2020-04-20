""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

let $VIMFILES = expand("~/.vim")

" Plugins {{{
if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('tpope/vim-sensible')  " sensible vim defaults.
  call minpac#add('nanotech/jellybeans.vim')  " colourscheme
  call minpac#add('wakatime/vim-wakatime')  " track time per editor, lang, etc.
  call minpac#add('yuezk/vim-js')  " improve JS syntax
  call minpac#add('MaxMEllon/vim-jsx-pretty')  " improve JSX syntax
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" }}}

" Colours {{{
if (has("termguicolors") && !empty($COLORTERM))
  set termguicolors " Enable 24-bit colours in terminal vim (if supported).
endif
colorscheme jellybeans
" }}}

" Misc {{{
set hidden   " Possibility to have more than one unsaved buffer.
set autoread " Read file changes.

set complete+=d " Scan current and included files for defined name or macro.

" Centralize backups, swapfiles and undo history
set backupdir=$VIMFILES/backups
set directory=$VIMFILES/swaps
if exists("&undodir")
  set undodir=$VIMFILES/undo
endif
" }}}

" Spaces & Tabs {{{
set tabstop=2       " Number of visual spaces per TAB.
set softtabstop=2   " Number of spaces in tab when editing.
set expandtab       " Tabs are spaces.
set shiftwidth=2    " Number of spaces when visual indenting.
" }}}

" UI Layout {{{
set number          " Show line numbers.
set splitbelow      "New splits below, not above
set splitright      "New splits on the right, not left

" Set and show tite; which contains the buffer's name, indicators for modified
" and read-only, value of the global variable cur_project (if set), path of the
" current buffer relative from current directory, the current working directory
" itself, and finally, the servername.
set title
let &titlestring = '%t%( %m%r%)%( <%{get(g:, "cur_project", "")}>%)' .
      \ '%( (%{expand("%:~:.:h")})%)' .
      \ '%( (%{getcwd()})%)%( %a%) - %(%{v:servername}%)'
" }}}

" Searching {{{
set ignorecase " Ignore case when searching.
set smartcase  " Ignore case unless CAPS.
set hlsearch   " Highlight matches.

" Ignore tag files
set wildignore+=tags,tags.*
" Allow expanding wildmenu.
" Remove unused directory from path.
set path-=/usr/include
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
nnoremap <Leader>e :edit **/
nnoremap <Leader>f :find **/
nnoremap <Leader>s :sfind **/
nnoremap <Leader>v :vert sfind **/
nnoremap <Leader>t :tabfind **/

" Rename current file.
nnoremap <Leader>n :call RenameFile()<cr>
" }}}

"" SCRATCH AREA

nnoremap <Leader>m :make %<CR>

" # vim: set syntax=vim:
