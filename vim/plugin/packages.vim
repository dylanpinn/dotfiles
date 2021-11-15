"""
" This plugin configures minpac and the list of dependencies that it manages.
"
function! PackInit() abort
  packadd minpac

  call minpac#init()
  " Load minpac using minpac.  This is loaded as optional plugin and loaded
  " only when required to update plugins.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " I use Wakatime to roughly track how much actual "development" is happening
  " and what I am working on.  This isn't always accurate as can be doing pair
  " programming on a remote computer.
  call minpac#add('wakatime/vim-wakatime')

  " Attempt to standardise indentation and other styling by reading
  " configuration values from a .editorconfig file if present.  This is loaded
  " on demand only if there is a .editorconfig file present at the :pwd path.
  call minpac#add('editorconfig/editorconfig-vim', {'type': 'opt', 'name': 'editorconfig'})

  " Improve JavaScript syntax highlighting to include modern (ES5+) features.
  call minpac#add('yuezk/vim-js')
  call minpac#add('maxmellon/vim-jsx-pretty')

  " Semi basic colour scheme.  Haven't found anything else that I like more.
  call minpac#add('nanotech/jellybeans.vim')

  " Optionally load LSP plugin.
  call minpac#add('prabirshrestha/vim-lsp') ", {'type': 'opt'})
  call minpac#add('mattn/vim-lsp-settings') ", {'type': 'opt'})
endfunction

" Load minpac and then manage it.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
