""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one unsaved
                               " buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the
                               " bottom-right of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to
                               " move around and `<CR>` to validate.
set number                     " Show line numbers.

" Spacing
set shiftwidth=2               " Set tabwidth to 2 spaces.
let &softtabstop = &shiftwidth " Set softtabs to same as shiftwidth.
set expandtab                  " Use spaces instead of tabs.

" Colours
if !empty($COLORTERM)
  set termguicolors " Enable 24-bit colours in terminal vim (if supported).
endif
