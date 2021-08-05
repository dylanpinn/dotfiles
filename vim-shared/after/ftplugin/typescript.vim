" Use Prettier as the 'formatprg' for TypeScript files.
" The only issue is that Prettier usually works best when formatting a whole
" file and not a section of it, so there could be inconsistencies with
" indentation. A fix for this is to use 'equalprg' to re-indent the formatted
" block with `gp=`.
"
setlocal formatprg=npx\ prettier\ --parser\ typescript

" Use ESLint as the prefered compiler for JavaScript files.
"
compiler eslint
