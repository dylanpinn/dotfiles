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
