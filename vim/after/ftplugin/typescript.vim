" TypeScript

" Go to File
setlocal suffixesadd+=.ts " Add TypeScript files.
setlocal suffixesadd+=.js " Add JavaScript files.

" Include file searching
setlocal include=from
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'

set makeprg=npx\ tsc
