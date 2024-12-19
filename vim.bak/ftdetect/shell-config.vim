" Vim already wraps this inside a Group when sourcing the file.
" vint: -ProhibitAutocmdWithNoGroup
autocmd BufRead,BufNewFile bash/bash_profile  setfiletype bash
