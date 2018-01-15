" install plugins
call plug#begin()
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'                 " surrounding tags
Plug 'tpope/vim-repeat' 		  " more repeating
Plug 'Townk/vim-autoclose'                " autoclose tags
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'ajh17/VimCompletesMe' " auto-complete
Plug 'aklt/plantuml-syntax' " plant-uml syntax
Plug 'dhruvasagar/vim-table-mode' " markdown tables
Plug 'jlanzarotta/bufexplorer' " buffer exploring
Plug 'ludovicchabant/vim-gutentags' " tag indexing
Plug 'tomtom/tlib_vim' " required for ttags_vim
Plug 'tomtom/ttags_vim' " tag management
Plug 'pangloss/vim-javascript' " enhanced js syntax
Plug 'mxw/vim-jsx' " jsx syntax
Plug 'majutsushi/tagbar'	" class outline viewer
Plug 'w0rp/ale'           " async linting
Plug 'othree/html5.vim'     " html5 syntax support
Plug 'pangloss/vim-javascript'    " better js support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " ternjs support
Plug 'airblade/vim-gitgutter' " git gutter support
Plug 'flowtype/vim-flow' " flow type support
Plug 'mustache/vim-mustache-handlebars' " handlbars and moustache support
call plug#end()

" auto-complete
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict' " markdown & text

" custom settings
" """""""""""""""

" enable project .vimrc
set exrc
set secure

" use system register for yanking
" set clipboard=unnamedplus

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

" markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'java', 'lisp']
set conceallevel=2
set concealcursor=nc
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" F2 is pastetoggle
set pastetoggle=<F2>

" markdown compatible tables
let g:table_mode_corner='|'

" Allow JSX in JS files
let g:jsx_ext_required = 0

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

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>yy "*Y

" Ale Linting
"""""""""""""

let g:ale_linters = {
\  'eruby': []
\}

