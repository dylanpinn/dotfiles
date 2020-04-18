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
set hidden   " Possibility to have more than one unsaved buffer.
set autoread " Read file changes.

set complete+=d " Scan current and included files for defined name or macro.

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
set number          " Show line numbers.
set splitbelow      "New splits below, not above
set splitright      "New splits on the right, not left
" }}}

" Searching {{{

set grepprg=ag\ --vimgrep "Use better searching tool.

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
nnoremap <Leader>s :sfind **/*<C-z><S-Tab>
nnoremap <Leader>v :vert sfind **/*<C-z><S-Tab>
nnoremap <Leader>t :tabfind **/*<C-z><S-Tab>

nnoremap <Leader>n :call RenameFile()<cr>
" }}}

" Async grepping without losing vim focus.
function! Grep(...)
  return system(join([&grepprg] + [a:1] + [expandcmd(join(a:000[1:-1], ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'grep'

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  " TODO: Figure out what nested does.
  " autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost l* lwindow
  " autocmd QuickFixCmdPost    l* nested lwindow
augroup END
" # vim: set syntax=vim:
