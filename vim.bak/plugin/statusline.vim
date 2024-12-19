" Setup statusline
"
set statusline+=%f          " Show path relative to current directory.
set statusline+=%m          " Modified flag in square brackets.
set statusline+=%r          " Readonly flag in square brackets.
set statusline+=%h          " Help buffer flag in square brackets..
set statusline+=%w          " Preview window flag in square brackets.
set statusline+=[%L]        " Number of lines in buffer wrapped in square brackets.
set statusline+=[%{&ff}]    " Current fileformat wrapped in square brackets.
set statusline+=%y          " Current filtetype wrapped in square brackets.
set statusline+=[%p%%]      " Current percentage into file.
set statusline+=[%04l,%04v] " Current line and column.
