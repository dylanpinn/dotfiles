" let b:ale_fixers = {}
" let b:ale_fixers['ruby'] = ['rubocop']        " use rubocop
if exists("g:loaded_VimCompletesMe")
  " use omni completion
  let b:vcm_tab_complete = 'omni'
endif
setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

" Promote RSpec variable to let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>y :call RunNearestSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
