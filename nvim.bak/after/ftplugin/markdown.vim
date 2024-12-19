" Format whole file using Prettier.
" There are issues using formatprg, so running this as a separate command
" seems the best solution that doesn't involve a new plugin.
"
nnoremap <LocalLeader>f :silent %!npx prettier --stdin-filepath %<CR>

" Use system word list for completion with CTRL-P or CTRL-N.
"
setlocal complete+=k/usr/share/dict/words
