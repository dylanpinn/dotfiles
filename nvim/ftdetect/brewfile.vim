" Vim already wraps this inside a Group when sourcing the file.
" vint: -ProhibitAutocmdWithNoGroup
au BufRead,BufNewFile *.Brewfile,Brewfile   setfiletype ruby
