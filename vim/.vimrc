""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" General {{{
" This will be the configuration file for "most" of vim. This file (vimrc)
" should be the only file located in the home directory.
let $VIMFILES = expand('$HOME/.vim')

" Move the viminfo file out of the home directory.
set viminfofile=$VIMFILES/viminfo

" Increase size of history from 50 to 1000.
set history=1000

" Create automatic backups for all files.
" Store these in the ~/.vim/backups directory. Double slashes are added to the
" end of the path to ensure that the file names are constructed using the full
" path. This ensures that file collisions are minimised.
set backup
set backupdir=$VIMFILES/backups//

" Keep swapfiles out of the current directory. Double slashes are added to the
" end of the path to reduce naming collisions.
set directory=$VIMFILES/swaps//

" Keep track of undo history for files. Check if the current vim version has
" this enabled and then save these using the full file path to avoid collisions.
if has('persistent_undo')
  set undofile
  set undodir=$VIMFILES/undo//
endif

" Enable 24-bit colours in terminal vim (if it is supported by Vim and the
" terminal).
if (has('termguicolors') && !empty($COLORTERM))
  set termguicolors
endif

" Load colorscheme.
colorscheme jellybeans

" Vim by default does not allow a file buffer to have unsaved changes if it is
" not displayed in a window. Ideally, most buffers would be saved before moving
" away from them, however, this option now allows this.
set hidden

" Automatically Reload files if they have changed on the disk.
set autoread

" Use 2 spaces as indent. If tabs or changes are needed this should be done on a
" filetype by filetype basis in after/ftplugin/*.vim.
set tabstop=2       " Number of visual spaces per TAB.
set softtabstop=2   " Number of spaces in tab when editing.
set expandtab       " Tabs are spaces.
set shiftwidth=2    " Number of spaces when visual indenting.
" }}}}

" Plugins {{{
" Use vim Minpac (https://github.com/k-takata/minpac) to manage plugins. This
" uses the built in Vim 8 package feature.
"
" Main reason for using this is to load 3rd party plugins without having to deal
" with submodules or install scripts.
if exists('*minpac#init')
  call minpac#init()
  " Load minpac using minpac (Inception). This is loaded as optional plugin and
  " loaded only when required to update plugins.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " A universal set of defaults that (hopefully) everyone can agree on. Might
  " look into replacing this in the future with the defaults directly. However,
  " I do like being able to add some settings that are almost considered best
  " practices.
  call minpac#add('tpope/vim-sensible')

  " Color (colour) scheme; tried many but always come back to this one. Will
  " probably last me until I go down the rabbithole of creating my own.
  call minpac#add('nanotech/jellybeans.vim')

  " Provid mappings to easily delete, change and add surroundings in pairs.
  " Surroundings are defined as parentheses, brackets, quotes, XML tags, and
  " more.
  call minpac#add('tpope/vim-surround')

  " I use Wakatime to roughly track how much actual "development" I am doing and
  " what I am doing. This isn't always accurate as can be doing pair programming
  " on a remote computer.
  call minpac#add('wakatime/vim-wakatime')

  " Improve JavaScript syntax highlighting, enhances highlighting for >= ES5.
  call minpac#add('yuezk/vim-js')

  " Improve JSX syntax highlighting, Vim's default highlighting can leave a bit
  " to be desired.
  call minpac#add('MaxMEllon/vim-jsx-pretty')

  " Improved TypeScript syntax highlight.
  call minpac#add('leafgarland/typescript-vim')

  " Attempt to standardise indentation and other styling by reading
  " configuration values from an .editorconfig file if present.
  call minpac#add('editorconfig/editorconfig-vim')

  " Improve netrw.
  call minpac#add('tpope/vim-vinegar')

  call minpac#add('editorconfig/editorconfig-vim')

  " Linting, fixing and LSP support.
  call minpac#add('dense-analysis/ale')

  " Disable all linters by default.
  let g:ale_linters_explicit = 1
  " Use quickfix list instead of loclist.
  " let g:ale_set_loclist = 0
  " let g:ale_set_quickfix = 1
  " Automatically open list when there are errors.
  " let g:ale_open_list = 1

  " Improve built in auto-complete by using <Tab> to intelligently select best
  " method.
  call minpac#add('ajh17/VimCompletesMe')
endif

" Manage Minpac commands by loading the plugin then executing the commands.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
" }}}

" UI Layout {{{
set number          " Show line numbers.
set splitbelow      " New horizontal splits below, not above
set splitright      " New vertical splits on the right, not left
set cursorline      " Highlight current line.

" Set and show title; which contains the buffer's name, indicators for modified
" and read-only, value of the global variable cur_project (if set), path of the
" current buffer relative from current directory, the current working directory
" itself, and finally, the server name.
set title
let &titlestring = '%t%( %m%r%)%( <%{get(g:, "cur_project", "")}>%)' .
      \ '%( (%{expand("%:~:.:h")})%)' .
      \ '%( (%{getcwd()})%)%( %a%) - %(%{v:servername}%)'
" }}}

" Searching {{{
set ignorecase " Ignore case when searching.
set smartcase  " Ignore case unless CAPS.
set hlsearch   " Highlight matches.

" Remove unused directory from path.
set path-=/usr/include

" Use ripgrep as default grep program, this is faster than "grep" and also
" performs recursive search and respects ignore files by default.
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
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
let mapleader=','

" Fuzzy searching using wildmenu.
nnoremap <Leader>e :edit **/
nnoremap <Leader>f :find **/
nnoremap <Leader>s :sfind **/
nnoremap <Leader>v :vert sfind **/
nnoremap <Leader>t :tabfind **/

" Rename current file.
nnoremap <Leader>n :call RenameFile()<cr>

" Run :make to either test, build or lint. This improves feeback time when
" developing.
nnoremap <Leader>m :make %<CR>

" Edit vimrc in a new tab.
nnoremap cv :tabedit $MYVIMRC<CR>

" Simple mappings for buffer switching.
nnoremap <Leader>b :b *
nnoremap <Leader>l :ls<CR>
" }}}

" SCRATCH AREA {{{

" Wildmenu enables enhanced command-line completion.
" Press <Tab> to invoke completion.
if has('wildmenu')
  " Ignore filetypes and directories that I will not want to edit in vim.
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git
  set wildignore+=*~,*.swp,*.tmp
  set wildignore+=tags,tags.*
  set wildignore+=node_modules/*
  set wildmenu
  " set wildmode=longest:full,full
  " set wildmode=longest,list
  set wildmode=list:longest,full

  " Ignore case in the Ex command line.
  if exists('+wildignorecase')
    set wildignorecase
  endif
endif
" }}}}

" # vim: set syntax=vim:
