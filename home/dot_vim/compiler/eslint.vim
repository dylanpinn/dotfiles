" :compiler support for JavaScript and TypeScript linting with ESLint
if exists('current_compiler')
    finish
endif
let current_compiler = 'eslint'

CompilerSet makeprg=npx\ eslint\ -f\ unix\ --ext\ .ts,.js,.tsx,.jsx
CompilerSet errorformat=%f:%l:%c:\ %#%m
