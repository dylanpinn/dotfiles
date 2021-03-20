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

  " I use Wakatime to roughly track how much actual "development" is happening
  " and what I am working on.  This isn't always accurate as can be doing pair
  " programming on a remote computer.
  call minpac#add('wakatime/vim-wakatime')
endfunction

" Load minpac and then manage it.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
