"" Plugins {{{
" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()
Plug 'tpope/vim-sensible'                 " sensible defaults
Plug 'editorconfig/editorconfig-vim'      " editor config support
Plug 'chriskempson/base16-vim'            " themes
Plug 'mbbill/undotree'                    " undo tree
Plug 'mileszs/ack.vim'                    " searching
Plug 'scrooloose/nerdtree'                " file tree
Plug 'Aldlevine/nerdtree-git-plugin'      " highlight git changes
Plug 'unkiwii/vim-nerdtree-sync'          " show current file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'                 " fuzzy file search
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'wakatime/vim-wakatime'              " wakatime
Plug 'tpope/vim-fugitive'                 " git manager
Plug 'airblade/vim-gitgutter'             " git gutter
Plug 'ajh17/VimCompletesMe'               " auto-completion
Plug 'vim-ruby/vim-ruby'                  " improve ruby config
Plug 'w0rp/ale'                           " async linting
Plug 'jlanzarotta/bufexplorer'            " buffer explorer
Plug 'ludovicchabant/vim-gutentags'       " tag indexing
call plug#end()
" }}}

"" Colours {{{
colorscheme base16-eighties
syntax enable           " enable syntax processing
" }}}

"" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " number of spaces when visual indenting
" }}}

"" UI Config {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " don't highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" }}}

"" Search {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Use ag with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Search with fzf
nmap <C-p> :Files<CR>
" }}}

"" {{{ Splits
set splitbelow "New splits below, not above
set splitright "New splits on the right, not left

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}


"" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

"" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" nav between git hunks
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>
" }}}

"" Leader Shortcut {{{
let mapleader=","       " leader is comma
" toggle Undotree
nnoremap <leader>u :UndotreeToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
" }}}

"" Misc {{{
" Improve join lines
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
" don't store swap files in current directory
set directory=~/.vim/swapfiles//
" }}}

"" NERDTree {{{
" toggle with ctrl-/
nnoremap <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " show hidden files by default
" Open NERDTree on start up if no files in buffer
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()

" nerd-tree-sync
let g:nerdtree_sync_cursorline=1 " Enable syncing of active file to nerdtree
" }}}

"" Undotree {{{
if has("persistent_undo")
  set undodir=~/.vim/undodir/
  set undofile
endif
" }}}

" vim:foldmethod=marker:foldlevel=0

