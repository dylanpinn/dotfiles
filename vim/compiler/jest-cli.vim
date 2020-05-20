" Vim compiler file
" Compiler:	Jest-Cli
" Maintainer:	Craig Dallimore <decoy9697@gmail.com>

if exists("current_compiler")
  finish
endif
let current_compiler = "jest-cli"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=npx\ jest

CompilerSet errorformat=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)

let &cpo = s:cpo_save
unlet s:cpo_save
