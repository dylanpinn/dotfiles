""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

set hidden                     " Possibility to have more than one unsaved
                               " buffers.
set number                     " Show line numbers.

" Spacing
set shiftwidth=2               " Set tabwidth to 2 spaces.
let &softtabstop = &shiftwidth " Set softtabs to same as shiftwidth.
set expandtab                  " Use spaces instead of tabs.

" Colours
if !empty($COLORTERM)
  set termguicolors " Enable 24-bit colours in terminal vim (if supported).
endif

colorscheme apprentice " https://github.com/romainl/Apprentice
