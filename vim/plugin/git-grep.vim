" Check if .git directory in current root.  If so then use git-grep as
" grepprg.
function! SetGitGrep()
  if isdirectory('.git')
    setlocal grepprg=git\ grep\ -n\ $*
  endif
endfunction

call SetGitGrep()
