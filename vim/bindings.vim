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

