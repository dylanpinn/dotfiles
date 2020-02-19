""" Javascript

" Enable flow type syntax
let g:javascript_plugin_flow = 1
" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
