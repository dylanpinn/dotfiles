" :compiler support for Vim script linting with Vint
" <https://github.com/Kuniwak/vint>
if exists('current_compiler')
  finish
endif
let current_compiler = 'vint'

CompilerSet makeprg=vint\ --\ %:S
CompilerSet errorformat=%f:%l:%c:\ %m
