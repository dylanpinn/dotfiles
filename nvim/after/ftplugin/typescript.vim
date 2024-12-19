" Format whole file using Prettier.
" There are issues using formatprg, so running this as a separate command
" seems the best solution that doesn't involve a new plugin.
"
nnoremap <LocalLeader>f :silent %!npx prettier --stdin-filepath %<CR>

" Use treesitter for folding.
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
