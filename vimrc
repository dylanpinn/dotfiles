""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

""" Plugins

" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-sensible'                 " sensible defaults
Plug 'tpope/vim-surround'                 " quoting/paraenthese easier
Plug 'ajh17/VimCompletesMe'               " smarter completion
Plug 'wakatime/vim-wakatime'              " Wakatime
Plug 'editorconfig/editorconfig-vim'      " EditorConfig
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-dispatch'                 " Async tasks
Plug 'tpope/vim-fugitive'                 " Git manager
Plug 'tpope/vim-vinegar'                  " Improve netrw
Plug 'qpkorr/vim-bufkill'                 " rm bufs w/out closing splits
Plug 'w0rp/ale'                           " linting
Plug 'embear/vim-localvimrc'              " local vimrc

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'sheerun/vim-polyglot'               " improved language support
Plug 'tpope/vim-rails'                    " improve editing rails apps
Plug 'thoughtbot/vim-rspec'               " rspec runner

" Terminal/Tmux
Plug 'wincent/terminus'                   " improved terminal
Plug 'tmux-plugins/vim-tmux-focus-events' " Fix vim focus events inside tmux

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Import all .vim files in config
for f in split(glob('~/.vim/config/*.vim'), '\n')
  exe 'source' f
endfor

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Rename Current File
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ALE Configuration

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Only lint on save
let g:ale_lint_on_text_changed = 'never'
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" use quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" Open list on errors
let g:ale_open_list = 1
