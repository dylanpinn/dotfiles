#!/bin/zsh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# Initialise autocomplete
autoload -U compinit add-zsh-hook
compinit

# History
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY

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
alias ls='ls -G'
alias ll='ls -lG'

# Edit TODO file
alias todo='nvim ~/Desktop/TODO'

# Load completion menu styles last
source $HOME/.zsh/styles.zsh
