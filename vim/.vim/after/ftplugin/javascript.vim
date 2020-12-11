""" Javascript

" Go to files that have .js file extension.
setlocal suffixesadd+=.js

" Include file searching
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
let &l:define = '^\s*\(var\|let\|const\|class\|import\|function\)'

" Use eslint as compiler for all JavaScript files.
compiler eslint

let b:ale_linters = []
let b:ale_fixers = []

set omnifunc=ale#completion#OmniFunc

nnoremap <silent> <buffer> gd :ALEGoToDefinition<cr>
nnoremap <silent> <buffer> gr :ALEFindReferences<cr>
nnoremap <silent> <buffer> gj :ALENextWrap<cr>
nnoremap <silent> <buffer> gk :ALEPreviousWrap<cr>
nnoremap <silent> <buffer> g1 :ALEFirst<cr>
nnoremap <silent> <buffer> K :ALEHover<cr>

let b:vcm_tab_complete = 'omni'

