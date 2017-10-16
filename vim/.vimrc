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
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'                 " surrounding tags
Plug 'scrooloose/nerdtree'                " file tree
Plug 'Townk/vim-autoclose'                " autoclose tags
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'ajh17/VimCompletesMe' " auto-complete
Plug 'chriskempson/base16-vim' " theme
Plug 'aklt/plantuml-syntax' " plant-uml syntax
Plug 'dhruvasagar/vim-table-mode' " markdown tables
Plug 'jlanzarotta/bufexplorer' " buffer exploring
Plug 'wakatime/vim-wakatime' " wakatime
Plug 'ludovicchabant/vim-gutentags' " tag indexing
Plug 'tomtom/tlib_vim' " required for ttags_vim
Plug 'tomtom/ttags_vim' " tag management
Plug 'pangloss/vim-javascript' " enhanced js syntax
Plug 'mxw/vim-jsx' " jsx syntax
Plug 'ctrlpvim/ctrlp.vim'	" fuzzy file finder
Plug 'majutsushi/tagbar'	" class outline viewer
Plug 'w0rp/ale'           " async linting
Plug 'othree/html5.vim'     " html5 syntax support
Plug 'pangloss/vim-javascript'    " better js support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " ternjs support
Plug 'airblade/vim-gitgutter' " git gutter support
Plug 'flowtype/vim-flow' " flow type support
Plug 'mustache/vim-mustache-handlebars' " handlbars and moustache support
call plug#end()

"" Colour
colorscheme base16-eighties

" auto-complete
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict' " markdown & text

" custom settings
" """""""""""""""

" lead with ,
let mapleader = ","

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

" use system register for yanking
set clipboard=unnamedplus

" don't store swap files in current directory
set directory=~/.vim/swapfiles//

" NERDTREE
""""""""""

" toggle nerdtree with ,e
:nmap ,e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " show hidden files by default

" Open NERDTree on start up if no files in buffer
function! StartUp()
	if 0 == argc()
		NERDTree
	end
endfunction

autocmd VimEnter * call StartUp()

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

" add gutentags to statusline
set statusline+=%{gutentags#statusline()}

" ruby completions
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'java', 'lisp']
set conceallevel=2
set concealcursor=nc
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set nu " show line numbers

" F2 is pastetoggle
set pastetoggle=<F2>

" markdown compatible tables
let g:table_mode_corner='|'

" Allow JSX in JS files
let g:jsx_ext_required = 0

" CTRL-P
""""""""""""

" Change key mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" define starting directory
let g:ctrlp_working_path_mode = 'ra'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" Quickly find file in NERDTree
nnoremap <leader>f :NERDTreeFind<CR>

" Tagbar
"""""""""

nnoremap <silent> <Leader>b :TagbarToggle<CR>


" tags
"""""""""""

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

" javascript
""""""""""""

let g:javascript_plugin_jsdoc = 1 " enable syntax for JSDoc
let g:javascript_plugin_ngdoc = 1 " enable syntax for NGDoc
let g:javascript_plugin_flow = 1 " enable syntax for flow

" Editorconfig
""""""""""""""

" Ignore fugitive files
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

