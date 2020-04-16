" Vim ESLint Compiler
" Compiler:	eslint
" Maintainer:	Dylan Pinn <me@dylanpinn.com>

if exists("current_compiler")
    finish
endif
let current_compiler = "eslint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" TODO: Handle both yarn and npx projects.
CompilerSet makeprg=npx\ eslint\ -f\ unix

" filename:252:3: Error message goes here
CompilerSet errorformat=%f:%l:%c:\ %#%m

let &cpo = s:cpo_save
unlet s:cpo_save
