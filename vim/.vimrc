source ~/.vim/plugins.vim

" syntastic recommended settings
" """"""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" custom settings
" """""""""""""""

" lead with ,
let mapleader = ","

" toggle nerdtree with ,e
:nmap ,e :NERDTreeToggle<CR>

" enable project .vimrc
set exrc
set secure

" statusline
""""""""""""

" display current git branch
set statusline+=%{fugitive#statusline()}

