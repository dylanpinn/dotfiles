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
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'chriskempson/base16-vim'            " themes
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
Plug 'itchyny/vim-gitbranch'              " provide gitbranch for lightline
Plug 'tpope/vim-rhubarb'                  " GitHub support for fugitive
Plug 'ajh17/VimCompletesMe'               " auto-completion
Plug 'sheerun/vim-polyglot'               " language pack
Plug 'w0rp/ale'                           " async linting
Plug 'jlanzarotta/bufexplorer'            " buffer explorer
Plug 'ludovicchabant/vim-gutentags'       " tag indexing
Plug 'tmux-plugins/vim-tmux-focus-events' " improve vim tmux integration
Plug 'tmux-plugins/vim-tmux'              " improve tmux.conf
Plug 'christoomey/vim-tmux-navigator'     " navigate between vim and tmux
Plug 'wincent/terminus'                   " better vim and terminal support
Plug 'ap/vim-css-color'                   " highlight css colours
Plug 'itchyny/lightline.vim'              " statusline
Plug 'tpope/vim-unimpaired'               " more pair mappings
Plug 'tpope/vim-eunuch'                   " helpers for UNIX
Plug 'qpkorr/vim-bufkill'                 " close buff without closing tab
Plug 'tpope/vim-surround'                 " quoting/paraenthese easier
Plug 'tpope/vim-repeat'                   " enable more repeating
Plug 'mattn/emmet-vim'                    " emmet
Plug 'junegunn/goyo.vim'                  " distraction free writing
Plug 'godlygeek/tabular'                  " markdown tables
Plug 'plasticboy/vim-markdown'            " enhanced markdown
Plug 'thoughtbot/vim-rspec'               " rspec runner
Plug 'tpope/vim-bundler'                  " bundler integration
Plug 'tpope/vim-rails'                    " rails integration
Plug 'vim-ruby/vim-ruby'                  " latest ruby
Plug 'fatih/vim-go'                       " golang support
Plug 'pangloss/vim-javascript'            " improved javascript
Plug 'mxw/vim-jsx'                        " improved JSX
Plug 'octref/RootIgnore'                  " wildmenu ignore gitignore
call plug#end()
" }}}

"" Colours {{{
" colorscheme base16-tomorrow-night
colorscheme dracula
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

"" Search {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set smartcase           " ignore case unless CAPS
set hlsearch            " highlight matches
" turn off search highlight
nmap \q :nohlsearch<CR>
" Use ag with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Search with fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>
" }}}

"" Splits {{{
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
vnoremap <space> zf
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

"" Misc {{{
" Improve join lines
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
" don't store swap files in current directory
set directory=~/.vim/swapfiles//

" autoread file changes
set autoread
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

""" Javascript {{{
let g:javascript_plugin_jsdoc = 1   " syntax for jsdoc
let g:javascript_plugin_flow = 1    " syntax for flow
let g:jsx_ext_required=0            " Highlight JSX in .js files
" }}}

""" Lightline {{{
set noshowmode                      " don't show mode
" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}}

" ALE {{{
let g:ale_fixers = {}
" }}}

" {{{ Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0

