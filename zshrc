#!/bin/zsh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# Initialise autocomplete
autoload -U compinit add-zsh-hook
compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Search through history with up & down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Back and forward through words with alt <- & alt ->
if [[ `uname` == 'Darwin' ]]; then
  bindkey "^[^[[C" forward-word
  bindkey "^[^[[D" backward-word
fi
if [[ `uname` == 'Linux' ]]; then
  bindkey "^[[1;3C" forward-word
  bindkey "^[[1;3D" backward-word
fi

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'

# Colorize terminal
if [[ `uname` == 'Darwin' ]]; then
  alias ls='ls -G'
  alias ll='ls -lG'
fi
if [[ `uname` == 'Linux' ]]; then
  alias ls='ls --color'
  alias ll='ls -l --color'
fi


alias npm-global='npm list -g --depth=0'

# Dotfiles
alias dotfiles='cd ~/.dotfiles'

# Load completion menu styles last
source $HOME/.zsh/styles.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
