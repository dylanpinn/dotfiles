""" Javascript

" Go to File
setlocal suffixesadd+=.js " Add JavaScript files.

" Include file searching
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'

" Compilers
" Linting
" nnoremap <Leader>ml :set compiler eslint | make %
" Testing
" nnoremap <Leader>mt :make %<CR>
