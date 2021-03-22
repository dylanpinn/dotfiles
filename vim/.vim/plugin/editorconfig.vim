" Check if .editorconfig file exists in current project root.  If so then
" activate the plugin.
function! CheckForEditorconfig()
  if filereadable('.editorconfig')
    packadd editorconfig
  endif
endfunction

call CheckForEditorconfig()
