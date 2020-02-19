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

"" File finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

"" Buffer finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

"" Tag finder
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

"" Project finder
nmap <Leader>a :Ag<Space>

" Run make
nnoremap <leader>m :Make<cr>
