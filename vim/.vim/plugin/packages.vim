"""
" This plugin configures minpac and the list of dependencies that it manages.
"
function! PackInit() abort
  packadd minpac

  call minpac#init()
  " Load minpac using minpac.  This is loaded as optional plugin and loaded
  " only when required to update plugins.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Color (colour) scheme.  Using this one until I get sick of it and end up
  " creating my own or find another.
  call minpac#add('dracula/vim', {'name': 'dracula'})
endfunction

" Load minpac and then manage it.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
