" :compiler support for Ruby linting with Rubocop
" https://github.com/rubocop/rubocop
if exists('current_compiler')
    finish
endif
let current_compiler = 'rubocop'

CompilerSet makeprg=rubocop\ -f\ emacs
CompilerSet errorformat=%f:%l:%c:\ %#%m
