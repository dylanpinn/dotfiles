let b:ale_linters = ['metals']
let b:ale_fixers = []

set omnifunc=ale#completion#OmniFunc

nnoremap <silent> <buffer> gd :ALEGoToDefinition<cr>
nnoremap <silent> <buffer> gt :ALEGoToTypeDefinition<cr>
nnoremap <silent> <buffer> gr :ALEFindReferences<cr>
nnoremap <silent> <buffer> gj :ALENextWrap<cr>
nnoremap <silent> <buffer> gk :ALEPreviousWrap<cr>
nnoremap <silent> <buffer> g1 :ALEFirst<cr>
nnoremap <silent> <buffer> K :ALEHover<cr>

let b:vcm_tab_complete = 'omni'
