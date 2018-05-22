" Vim compiler file
" Compiler:   Rubocop
" Language:   Ruby
" ----------------------------------------------------------------------------

if exists("current_compiler")
  finish
endif
let current_compiler = "rubocop"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=rubocop\ --format\ emacs\ $*\ %:S

CompilerSet errorformat=
      \%W%f:%l:%c:\ C:\ %m,
      \%W%f:%l:%c:\ W:\ %m,
      \%E%f:%l:%c:\ E:\ %m,
      \%E%f:%l:%c:\ F:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

