" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()
Plug 'tpope/vim-sensible'                 " sensible defaults
Plug 'editorconfig/editorconfig-vim'      " editor config support
" TODO: Look at removing this.
Plug 'scrooloose/nerdtree'                " file tree
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" TODO: Look at removing this.
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
" TODO: Look at removing this.
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file search
call plug#end()
