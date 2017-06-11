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
" TODO: Look at removing this.
Plug 'scrooloose/nerdtree'                " file tree
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-syntastic/syntastic' " TODO: Look at removing this.
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
" TODO: Look at removing this.
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file search
Plug 'ajh17/VimCompletesMe' " auto-complete
Plug 'chriskempson/base16-vim' " theme
Plug 'aklt/plantuml-syntax' " plant-uml syntax
Plug 'dhruvasagar/vim-table-mode' " markdown tables
Plug 'jlanzarotta/bufexplorer' " buffer exploring
call plug#end()

"" Colour
colorscheme base16-flat


" syntastic recommended settings
" """"""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" auto-complete
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict' " markdown & text

" custom settings
" """""""""""""""

" lead with ,
let mapleader = ","

" toggle nerdtree with ,e
:nmap ,e :NERDTreeToggle<CR>

" enable project .vimrc
set exrc
set secure

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split opening
set splitbelow
set splitright

" make vim read file changes automatically
set autoread

" 80 characters textwidth
set textwidth=80
set colorcolumn=+1


" statusline
""""""""""""

" display current git branch
" set statusline+=%{fugitive#statusline()}
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

" ctrlp
" """"""

" change default mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tags
nnoremap <leader>. :CtrlPTag<cr>

" ruby completions
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
     \   if &omnifunc == "" |
                    \           setlocal omnifunc=syntaxcomplete#Complete |
                    \   endif
    endif


" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif


" markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'java', 'lisp']
set conceallevel=2
set concealcursor=nc
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set nu " show line numbers

" markdown compatible tables
let g:table_mode_corner='|'

