" ALE Configuration

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Only lint on save
let g:ale_lint_on_text_changed = 'never'
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" use quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" Open list on errors
let g:ale_open_list = 1

