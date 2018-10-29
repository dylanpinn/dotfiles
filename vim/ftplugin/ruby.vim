" Better Autocomplete
if exists("g:loaded_VimCompletesMe")
  " use omni completion
  let b:vcm_tab_complete = 'omni'
endif

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
setlocal omnifunc=rubycomplete#Complete

" RSpec
map <Leader>t :call RunCurrentSpecFile()<CR>
let g:rspec_command = "Dispatch rspec {spec}"
