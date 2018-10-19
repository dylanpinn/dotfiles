" Plugins
"" Plugins
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
Plug 'dracula/vim', { 'as': 'dracula' }   " theme
Plug 'tpope/vim-endwise'                  " auto end functions
Plug 'tpope/vim-vinegar'                  " netrw additions
Plug 'tpope/vim-abolish'                  " text manipulation
Plug 'tpope/vim-projectionist'            " help manage vim settings in projects
Plug 'tpope/vim-characterize'             " character encoding
Plug 'tpope/vim-dispatch'                 " dispatch tasks
Plug 'mbbill/undotree'                    " undo tree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'                 " fuzzy file search
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'wakatime/vim-wakatime'              " wakatime
Plug 'tpope/vim-fugitive'                 " git manager
Plug 'tpope/vim-rhubarb'                  " GitHub support for fugitive
Plug 'ajh17/VimCompletesMe'               " auto-completion
Plug 'w0rp/ale'                           " async linting
Plug 'ludovicchabant/vim-gutentags'       " tag indexing
Plug 'tomtom/tlib_vim'
  Plug 'tomtom/ttags_vim'                   " searching tags
Plug 'tmux-plugins/vim-tmux-focus-events' " improve vim tmux integration
Plug 'tmux-plugins/vim-tmux'              " improve tmux.conf
Plug 'christoomey/vim-tmux-navigator'     " navigate between vim and tmux
Plug 'wincent/terminus'                   " better vim and terminal support
Plug 'tpope/vim-unimpaired'               " more pair mappings
Plug 'tpope/vim-eunuch'                   " helpers for UNIX
Plug 'qpkorr/vim-bufkill'                 " close buff without closing tab
Plug 'tpope/vim-surround'                 " quoting/paraenthese easier
Plug 'tpope/vim-repeat'                   " enable more repeating
Plug 'godlygeek/tabular'                  " markdown tables
Plug 'plasticboy/vim-markdown'            " enhanced markdown
Plug 'thoughtbot/vim-rspec'               " rspec runner
Plug 'tpope/vim-bundler'                  " bundler integration
Plug 'tpope/vim-rails'                    " rails integration
Plug 'vim-ruby/vim-ruby'                  " latest ruby
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'            " improved javascript
Plug 'mxw/vim-jsx'                        " improved JSX
Plug 'AndrewRadev/splitjoin.vim'          " improved split & joins
Plug 'rizzatti/dash.vim'                  " Dash plugin
call plug#end()

" Colours
let g:dracula_colorterm = 0
colorscheme dracula
syntax enable           " enable syntax processing


"" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " number of spaces when visual indenting

"" UI Config
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
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Bindings
"" Leader Shortcut
let mapleader=","       " leader is comma

" toggle Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Quickly switch between last used buffers
nnoremap <leader><leader> <c-^>

" jump between quicklist items
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" turn off search highlight
nmap \q :nohlsearch<CR>

" Search with fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" space open/closes folds
nnoremap <space> za
vnoremap <space> zf

" Add shortcuts to current dir
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Toggle Spell check
nmap <silent> <leader>s :set spell!<CR>

"" Search
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set smartcase           " ignore case unless CAPS
set hlsearch            " highlight matches
" Improve the built in grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Completion
set omnifunc=syntaxcomplete#Complete

" Formatting
" Use par formatting for better paragraph formatting.
" TODO: Look at moving this out into txt, md & tex files only.
if executable("par")
  set formatprg=par\ -w78
endif

" Spelling
set spelllang=en_au

"" Splits
set splitbelow "New splits below, not above
set splitright "New splits on the right, not left

"" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" Indent folding with manual folds
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"" Misc
" Improve join lines
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
" don't store swap files in current directory
set directory=~/.vim/swapfiles//
" autoread file changes
set autoread

"" Undo
if has("persistent_undo")
  set undodir=~/.vim/undodir/
  set undofile
endif

" Tags {{{
" Show available tags
noremap <Leader>g. :TTags<cr>

" Show current buffer's tags
noremap <Leader>g% :call ttags#List(0, "*", "", ".")<cr>

" Show tags matching the word under cursor
noremap <Leader>g# :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")))<cr>

" Show tags with a prefix matching the word under cursor
noremap <Leader>g* :call ttags#List(0, "*", tlib#rx#Escape(expand("<cword>")) .".*")<cr>

" Show tags matching the word under cursor (search also in |g:tlib_tags_extra|)
noremap <Leader>g? :call ttags#List(1, "*", tlib#rx#Escape(expand("<cword>")))<cr>

" Show tags of a certain category
for c in split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    exec 'noremap <Leader>g'. c .' :TTags '. c .'<cr>'
endfor
" }}}

" Statusline
source ~/.vim/statusline.vim

" Autocmd
" Custom autocmd's
augroup vimrcEx
    " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Rename Current File {{{
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
" }}}

" Autoread files and autosave
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

" improved git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
