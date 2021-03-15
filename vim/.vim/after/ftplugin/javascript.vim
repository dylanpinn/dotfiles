""" Javascript

" Go to files that have .js file extension.
setlocal suffixesadd+=.js

" Include file searching
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'

" Use eslint as compiler for all JavaScript files.
compiler eslint
