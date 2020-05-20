""" Javascript

" Go to File
setlocal suffixesadd+=.js " Add JavaScript files.

" Include file searching
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'
