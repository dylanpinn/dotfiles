""" Javascript

" Enable flow type syntax
" let g:javascript_plugin_flow = 1
" Enable JSDoc syntax
" let g:javascript_plugin_jsdoc = 1

" Run prettier as formatprg
" setlocal formatprg=npx\ prettier\ --stdin\ --parser\ babel\ 2>\ /dev/null

" Folding
" setlocal foldmethod=syntax  " syntax highlighting items specify folds
" setlocal foldcolumn=1       " defines 1 col at window left, to indicate folding
" let javaScript_fold=1       " activate folding by JS syntax
" setlocal foldlevelstart=99  " start file with all folds opened

" Go to File
setlocal suffixesadd+=.js " Add JavaScript files.

" Include file searching
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'
