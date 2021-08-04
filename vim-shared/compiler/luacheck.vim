" Vim Luacheck Compiler
" Compiler:	luacheck
" Maintainer:	Dylan Pinn <me@dylanpinn.com>

if exists('current_compiler')
    finish
endif
let current_compiler = 'luacheck'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

CompilerSet makeprg=luacheck\ --formatter\ plain

" filename:252:3: Error message goes here
" filename:7:9: Error message goes here
CompilerSet errorformat=%f:%l:%c:\ %#%m

let &cpoptions = s:cpo_save
unlet s:cpo_save
