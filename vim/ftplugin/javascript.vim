""" Javascript

" Enable flow type syntax
let g:javascript_plugin_flow = 1
" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" Linting
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linters = ['eslint', 'flow']
