" Check if .git directory in current root.  If so then use git-grep as
" grepprg.
function! SetGitGrep()
  silent! !git rev-parse --is-inside-work-tree &>/dev/null
  if v:shell_error == 0
    setlocal grepprg=git\ grep\ -n\ $*
  endif
endfunction

call SetGitGrep()
