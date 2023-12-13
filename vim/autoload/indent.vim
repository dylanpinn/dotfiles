" Set the current buffer to space indent
function! indent#Spaces(...) abort
  setlocal expandtab

  " If an argument was provided, use that for the number of spaces; otherwise,
  " set 'shiftwidth' to 0, which then copies 'tabstop'
  let &l:shiftwidth = a:0
        \ ? a:1
        \ : 0

  " If we have the patch that supports it, set 'softtabstop' to dynamically
  " mirror the value of 'shiftwidth'; failing that, just copy it
  let &l:softtabstop = has('patch-7.3.693')
        \ ? -1
        \ : &l:shiftwidth

  call indent#Undo()
endfunction

" Set the current buffer to tab indent
function! indent#Tabs() abort
  setlocal noexpandtab shiftwidth< softtabstop<
  call indent#Undo()
endfunction

" Add commands to b:undo_indent to clean up buffer-local indentation changes
" on a change of filetype
function! indent#Undo() abort
  let undo = 'setlocal expandtab< shiftwidth< softtabstop<'
  if exists('b:undo_indent')
    let b:undo_indent .= '|'.undo
  else
    let b:undo_indent = undo
  endif
endfunction
