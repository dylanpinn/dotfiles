""" vimrc
"
" Author: Dylan Pinn
" Repo: https://github.com/dylanpinn/dotfiles

" Move the viminfo file out of the $HOME directory.  A logical place would be
" $XDG_CACHE_HOME (typically $HOME/.cache/).
"
" This file will only be created if this directory exists, so this is handled
" in the `install-vim` part of the Makefile.
"
set viminfofile=$XDG_CACHE_HOME/vim/viminfo

" Vim saves a history of `:` commands and search history in the viminfo file.
" By default this is set to 50. 200 is a better value to ensure that we are
" not losing any useful commands or search history.
"
set history=200

" Enable automatic backups before overwriting a file and leave it around after
" the file has been written.
"
" We will also want to move these backup files to the $XDG_CACHE_HOME
" directory.  This directory is created by the `install-vim` in the Makefile.
"
" The double trailing slashes will tell Vim to use the full escaped path of
" the file to avoid collisions.
"
set backup
set backupdir=$XDG_CACHE_HOME/vim/backup//

" Move swap files to a dedicated directory, rather than the default of the
" same directory as the source file.  This directory is created by
" `install-vim` in the Makefile.
"
" Add two trailing slashes to the path to tell Vim to use the full escaped
" path of the file to avoid collisions.
"
set directory=$XDG_CACHE_HOME/vim/swap//

" Keep track of undo history for files between sessions.  This ensures that
" undo and redo are available between Vim invocations.  These files are kept
" in a cache directory.  This directory is created by `install-vim` in the
" Makefile.
"
" Add two trailing slashes to the path to tell Vim to use the full escaped
" path of the file to avoid collisions.
"
set undofile
set undodir=$XDG_CACHE_HOME/vim/undo//

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
"
filetype plugin indent on

" When checking spelling, use Australian English by default.
"
set spelllang=en_au

" Vim includes defaults for comments and path that date back to its history as
" a mainly C development environment.  Removing these values allows us to use
" filetype plugins to set them as needed.
"
set comments= commentstring= define= include=
set path-=/usr/include

" Allow Vim's backspace to behave a bit more as you would expect it to.
"
set backspace+=indent	" Leading whitespace created by autoindent.
set backspace+=eol	" Line breaks.
set backspace+=start 	" Text before the start of the current insertion.

" When soft-wraps are enabled with 'wrap' option, then break the line between
" words, rather than within them.
"
set linebreak

" When wrapping a line using soft-wraps, highlight that it has been wrapped by
" inserting a leading string - "> ".
" 
" Using the following syntax so we don't have to escape the trailing space and
" have git yell at us for trailing whitespace.
:let &showbreak = '> '

" When wrapping a line, if that line is indented then the wrapped line is
" also indented the same amount.
"
set breakindent

" Automatic text wrapping options using flags in the 'formatoptions' option
" begin here.

" Don't break a line after a one-letter word like "I" or "a".
"
set formatoptions+=1

" When joining lines that contain comments, if possible remove the comment
" leader.
"
set formatoptions+=j

" Use two spaces to end a sentence. This helps improve readability using
" monospaced fonts.  This also helps vim work with sentence objects for the
" purpose of the 's' text objects, the '(' and ')' sentence motions, and
" formatting with the 'gq' command must now be separated by two spaces.
"
" See https://stevelosh.com/blog/2012/10/why-i-two-space/
"
set cpoptions+=J

" Because we are using two spaces for ending sentences. Vim can determine if
" the space after an abbreviation such as "Mr. Pinn" is the end of the
" sentence or not and then determine if it should be split on it. The 'p' flag
" makes this possible.
"
set formatoptions+=p

" Highlight search matches in the text.  Highlights then can be turned off by
" using :nohlsearch.  When this file is sourced, turn off any highlights that
" are set and would have been resurfaced.
"
set hlsearch
nohlsearch

" Start searching and highlighting as soon as something is typed.
"
set incsearch

" Don't redraw the screen when executing macros, registers and other commands
" that have not been typed.
"
set lazyredraw

" Set some default characters to show when the 'list' option is set. Most of
" these will help define invisible or indistinguishable characters. We will
" leave the default eol:$ to show newlines.
"
set listchars+=tab:>- 	" Tab characters, preserve width with hyphens.
set listchars+=trail:-	" Trailing spaces.
set listchars+=nbsp:+ 	" Non-breaking spaces.

" These two options define what is shown when text is not wrapped and
" continues off the screen.
"
set listchars+=extends:»,precedes:«

" Disable modeline, editor options should not be set in the source code of the
" file.  It is better to use filetype plugins, automatic command hooks, or
" EditorConfig to set these values.
"
set nomodeline

" Numbers that start with a zero should be treated as decimal and not octal.
" This allows Vim to increment and decrement these numbers.
"
set nrformats-=octal

" Show the line and column number of the cursor position at the last line of
" the screen.
"
set ruler

" I prefer when Vim opens new splits to the right and below the current,
" rather than the default of to the left and above.  This just makes more
" sense.
"
set splitbelow splitright

" Show (partial) command in the last line of the screen.
"
set showcmd

" When using virtual block mode, allow me to navigate to to any column even if
" there is no contents there.
"
set virtualedit+=block

" Stop Vim from emitting sounds, rather use a visual bell. Also disables any
" efforts by Vim that would trigger any visual queues such as flashing or
" blinking.
"
set visualbell t_vb=

" When completing commands with <Tab>, list valid completions and complete the
" command line using the longest common substring with a single key press.
"
set wildmenu
set wildmode=list:longest,full

" Configure the wildmenu to ignore a list of patterns for file and directory
" command line completion.  Files and directories matching any of these
" patterns won't be presented as candidates for tab completion on the command
" line.
"
" The list combines a mixture of binary files that would not contain text and
" therefore would not want to edit, and directories that contain generated
" files that won't want to be edited either.
"
set wildignore+=node_modules/* 	" ignore dependency directories.

" Ignore case when matching wildmenu options.
"
set wildignorecase

" Switch syntax highlighting on if it already not enabled.
if !exists('syntax_on')
  syntax on
endif
