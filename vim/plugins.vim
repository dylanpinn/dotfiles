"" Plugins
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
Plug 'dracula/vim', { 'as': 'dracula' }   " theme
Plug 'tpope/vim-endwise'                  " auto end functions
Plug 'tpope/vim-vinegar'                  " netrw additions
Plug 'tpope/vim-abolish'                  " text manipulation
Plug 'tpope/vim-projectionist'            " help manage vim settings in projects
Plug 'tpope/vim-characterize'             " character encoding
Plug 'tpope/vim-dispatch'                 " dispatch tasks
Plug 'mbbill/undotree'                    " undo tree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'                 " fuzzy file search
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'wakatime/vim-wakatime'              " wakatime
Plug 'tpope/vim-fugitive'                 " git manager
Plug 'tpope/vim-rhubarb'                  " GitHub support for fugitive
Plug 'ajh17/VimCompletesMe'               " auto-completion
Plug 'w0rp/ale'                           " async linting
Plug 'ludovicchabant/vim-gutentags'       " tag indexing
Plug 'tomtom/tlib_vim'
  Plug 'tomtom/ttags_vim'                   " searching tags
Plug 'tmux-plugins/vim-tmux-focus-events' " improve vim tmux integration
Plug 'tmux-plugins/vim-tmux'              " improve tmux.conf
" Plug 'christoomey/vim-tmux-navigator'     " navigate between vim and tmux
" Plug 'wincent/terminus'                   " better vim and terminal support
Plug 'tpope/vim-unimpaired'               " more pair mappings
Plug 'tpope/vim-eunuch'                   " helpers for UNIX
Plug 'qpkorr/vim-bufkill'                 " close buff without closing tab
Plug 'tpope/vim-surround'                 " quoting/paraenthese easier
Plug 'tpope/vim-repeat'                   " enable more repeating
Plug 'godlygeek/tabular'                  " markdown tables
Plug 'plasticboy/vim-markdown'            " enhanced markdown
Plug 'thoughtbot/vim-rspec'               " rspec runner
Plug 'tpope/vim-bundler'                  " bundler integration
Plug 'tpope/vim-rails'                    " rails integration
Plug 'vim-ruby/vim-ruby'                  " latest ruby
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'            " improved javascript
Plug 'mxw/vim-jsx'                        " improved JSX
Plug 'AndrewRadev/splitjoin.vim'          " improved split & joins
call plug#end()

