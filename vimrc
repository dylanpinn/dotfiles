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

  call minpac#add('neoclide/coc.nvim', { 'type': 'opt', 'branch': 'release' })
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

" Edit vimrc in a new tab.
nnoremap cv :tabedit $MYVIMRC<CR>

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
  autocmd QuickFixCmdPost l*    lwindow
  " autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" Source the vimrc file after saving it
" TODO: Wrap in augroup
" TODO: Move to ftplugin
if has("autocmd")
  augroup write_vimrc
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost vimrc source $MYVIMRC
  augroup END
endif

" Edit my filetype/syntax plugin files for current filetype.
command -nargs=? -complete=filetype EditFileTypePlugin
            \ exe 'keepj vsplit $VIMFILES/after/ftplugin/' . (empty(<q-args>) ? &filetype : <q-args>) . '.vim'
command -nargs=? -complete=filetype Eft EditFileTypePlugin <args>

" Simple mappings for buffer switching.
nnoremap <Leader>d :b *
nnoremap <Leader>l :ls<CR>

nnoremap <Leader>m :make %<CR>
nnoremap <Leader>ml :compiler eslint <bar> make %<CR>
nnoremap <Leader>mt :compiler jest-cli <bar> make %<CR>

noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Insert current path
cnoremap %% <C-R>=expand('%:h').'/'<CR>
" RUN make on write
" autocmd BufWritePost <pattern> silent make! <afile> | silent redraw!
" autocmd BufWritePost *.py,*.js silent make! <afile> | silent redraw!


set showmatch " Jump back to matching bracket briefly.

" Make space more useful
nnoremap <leader><space> za

" Move line down.
noremap <leader>- ddp
noremap <leader>= ddkP

" Uppercase word
imap <C-u> <ESC>viwUea

let maplocalleader = "\\"

" Save VIMRC
nnoremap <leader>vs :source $MYVIMRC<CR>

" Edit vimrc in a new tab.
nnoremap <leader>ve :tabedit $MYVIMRC<CR>

" Surround in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" di"<esc>pa"<esc>
vnoremap <leader>( di(<esc>pa)<esc>

nnoremap H 0
nnoremap L $

inoremap jk <ESC>

" common spelling errors
iabbrev adn and

" # vim: set syntax=vim:
