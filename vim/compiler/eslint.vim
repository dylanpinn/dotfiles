" Vim Compiler FilE
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

" CompilerSet makeprg=eslint
CompilerSet makeprg=npx\ eslint\ -f\ unix

" first  line:
"     ant with jikes +E, which assumes  the following
"     two property lines in your 'build.xml':
"
"         <property name = "build.compiler"       value = "jikes"/>
"         <property name = "build.compiler.emacs" value = "true"/>
"
" second line:
"     ant with javac
"
" note that this will work also for tasks like [wtkbuild]
"
" CompilerSet errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
"     \%A\ %#[%.%#]\ %f:%l:\ %m,%-Z\ %#[%.%#]\ %p^,%C\ %#[%.%#]\ %#%m
" CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,
" 											 \%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,
" 											 \%-G%.%#

" First Line
" filename:252:3: Error message goes here
CompilerSet errorformat=%f:%l:%c:\ %#%m

" ,%-C%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
