" Plugins
source ~/.vim/plugins.vim

" Colours
source ~/.vim/colours.vim

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
source ~/.vim/bindings.vim

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
source ~/.vim/autocmds.vim

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

