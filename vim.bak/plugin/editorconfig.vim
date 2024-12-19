" Check if .editorconfig file exists in current project root.  If so then
" enable and use the built-in EditorConfig plugin.

function! CheckForEditorconfig()
  if filereadable('.editorconfig')
    packadd editorconfig
  endif
endfunction

call CheckForEditorconfig()
