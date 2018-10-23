""" ESLint compiler

if exists('current_compiler')
    finish
endif
let current_compiler = 'eslint'

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat=
    \%-G%.%#File\ ignored\ by\ default%.%#,
    \%f:\ line\ %l\\,\ col\ %c\\,\ Error\ -\ %m,%f:\ line\ %l\\,\ col\ %c\\,\ Warning\ -\ %m
CompilerSet makeprg=yarn\ eslint\ --fix\ -f\ compact\ %

let &cpo = s:cpo_save
unlet s:cpo_save

