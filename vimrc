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
Plug 'wakatime/vim-wakatime'              " Wakatime
Plug 'editorconfig/editorconfig-vim'      " EditorConfig
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-dispatch'                 " Async tasks
Plug 'tpope/vim-fugitive'                 " Git manager
Plug 'tpope/vim-vinegar'                  " Improve netrw
Plug 'qpkorr/vim-bufkill'                 " rm bufs w/out closing splits
" Plug 'embear/vim-localvimrc'              " local vimrc
Plug 'ajh17/VimCompletesMe'               " better auto-complete
" Plug 'junegunn/fzf.vim'                   " Bindings for FZF

" Language Support
Plug 'sheerun/vim-polyglot'               " improved language support
" Plug 'tpope/vim-rails'                    " improve editing rails apps
" Plug 'godlygeek/tabular'                  " Improved table support
Plug 'plasticboy/vim-markdown'            " Improved markdown support
" Plug 'janko/vim-test'                     " Test runner

" Terminal/Tmux
" Plug 'wincent/terminus'                   " improved terminal
" Plug 'tmux-plugins/vim-tmux-focus-events' " Fix vim focus events inside tmux

" Tags
Plug 'ludovicchabant/vim-gutentags'       " auto-generate tags file
" Plug 'tomtom/ttags_vim'                   " tag explorer
" Plug 'tomtom/tlib_vim'                    " dep for ttags_vim

" Theme
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Import all .vim files in config
" for f in split(glob('~/.vim/config/*.vim'), '\n')
"   exe 'source' f
" endfor

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

" "" File finder
" nmap <Leader>f :GFiles<CR>
" nmap <Leader>F :Files<CR>

" "" Buffer finder
" nmap <Leader>b :Buffers<CR>
" nmap <Leader>h :History<CR>

"" Tag finder
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

" "" Project finder
" nmap <Leader>a :Ag<Space>

" " Run make
" nnoremap <leader>m :Make %<cr>

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

""" Searching

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set smartcase           " ignore case unless CAPS
set hlsearch            " highlight matches

" Improve the built in grep
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
"   set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif

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

""" Colours
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

set background=dark
colorscheme palenight

"" Automatically open, but do not go to (if there are errors) the quickfix /
"" location list window, or close it when is has become empty.
""
"" Note: Must allow nesting of autocmds to enable any customizations for quickfix
"" buffers.
"" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
"" (but not if it's already open). However, as part of the autocmd, this doesn't
"" seem to happen.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

"" Rename Current File
"function! RenameFile()
"    let old_name = expand('%')
"    let new_name = input('New file name: ', expand('%'), 'file')
"    if new_name != '' && new_name != old_name
"        exec ':saveas ' . new_name
"        exec ':silent !rm ' . old_name
"        redraw!
"    endif
"endfunction
"map <leader>n :call RenameFile()<cr>

"" Markdown options

"" This line prevents polyglot from loading markdown packages.
"let g:polyglot_disabled = ['md', 'markdown']

"" This line configures markdown-vim to highlight code blocks for given languages.
"let g:markdown_fenced_languages = ['html', 'css', 'php', 'js']

"" Enable Markdown math
"let g:vim_markdown_math = 1

"let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_toml_frontmatter = 1
"let g:vim_markdown_strikethrough = 2
"let g:vim_markdown_folding_disabled = 1

"" Softwrap
"command! -nargs=* Wrap set wrap linebreak nolist

"" Toggle spell checking on and off with `,s`
"nmap <silent> <leader>s :set spell!<CR>

"" Set region to Australian English
"set spelllang=en_au

"if has("autocmd")
"  " Restore cursor position
"  autocmd BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
"endif

"" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"  autocmd bufwritepost vimrc source $MYVIMRC
"endif

"" Edit vimrc in a new tab.
"nmap <leader>v :tabedit $MYVIMRC<CR>

"" FZF - Add to path if installed using Homebrew
"set rtp+=/usr/local/opt/fzf

"set wildcharm=<C-z>
"nnoremap ,e :e **/*<C-z><S-Tab>
