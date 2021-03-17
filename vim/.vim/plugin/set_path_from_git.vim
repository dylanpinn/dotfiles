" Set path using directories tracked in Git.
"
" Taken from https://github.com/romainl/vim/blob/improve-js-ftplugin/runtime/autoload/javascript/path.vim

function! SetPathFromGit() abort
  " If applicable, ask Git for the list of tracked directories
  if isdirectory('.git')
    call <SID>UpdatePathWithGit()
  endif
endfunction

function! s:UpdatePathWithGit() abort
  let cmd = [ 'git', 'rev-parse', '--abbrev-ref', 'HEAD' ]
  let opt = { 'callback': 'set_path_from_git#GitBranchHandler' }
  call s:JobStart(cmd, opt)
endfunction

function! s:BuildPath(paths) abort
  if len(a:paths)
    setlocal path-=.
    setlocal path-=/usr/include
    setlocal path-=node_modules
    setlocal path-=,
    setlocal path-=**

    let local_paths = split(&l:path, ',') + a:paths
    let full_path = [ '.' ] + uniq(sort(local_paths)) + [ ',' ]

    let &l:path = join(full_path, ',')
  endif
endfunction

function! s:JobStart(cmd, opt) abort
  if has('nvim')
    :call jobstart(a:cmd, a:opt)
  else
    :call job_start(a:cmd, a:opt)
  endif
endfunction

function! set_path_from_git#GitBranchHandler(channel, msg) abort
  let cmd = [ 'git', 'ls-tree', '-d', '-z', '--name-only', a:msg ]
  let opt = { 'callback': 'set_path_from_git#GitDirsHandler' }
  call s:JobStart(cmd, opt)
endfunction

function! set_path_from_git#GitDirsHandler(channel, msg) abort
  let paths = split(a:msg, "\x0")
  let paths = filter(paths, { idx, val -> val != '^\.' })
  let paths = map(paths, { idx, val -> val . '/**' })

  if len(paths)
    call s:BuildPath(paths)
  endif
endfunction
