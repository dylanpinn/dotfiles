" TypeScript

" Go to File
setlocal suffixesadd+=.ts " Add TypeScript files.
setlocal suffixesadd+=.js " Add JavaScript files.

" Include file searching
setlocal include=from
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'

set makeprg=npx\ tsc

let b:ale_linters = ['tsserver', 'eslint']
let b:ale_fixers = ['prettier']

set omnifunc=ale#completion#OmniFunc

nnoremap <silent> <buffer> gd :ALEGoToDefinition<cr>
nnoremap <silent> <buffer> gt :ALEGoToTypeDefinition<cr>
nnoremap <silent> <buffer> gr :ALEFindReferences<cr>
nnoremap <silent> <buffer> gj :ALENextWrap<cr>
nnoremap <silent> <buffer> gk :ALEPreviousWrap<cr>
nnoremap <silent> <buffer> g1 :ALEFirst<cr>
nnoremap <silent> <buffer> K :ALEHover<cr>
