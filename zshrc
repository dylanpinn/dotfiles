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

# Colorize terminal
alias ls='ls -G'
alias ll='ls -lG'

# Search through history with up & down
# # TODO: Get working in Ubuntu 17.10
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Back and forward through words with alt <- & alt ->
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# # Completion Stuff ???
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# # on MacOS dircolors is gdircolors with brew install coreutils
# if command gdircolors --help >/dev/null; then
#   alias dircolors="gdircolors"
# fi
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# # Android SDK
# # export ANDROID_HOME=${HOME}/Android/Sdk
# # export PATH=${PATH}:${ANDROID_HOME}/emulator
# # export PATH=${PATH}:${ANDROID_HOME}/tools
# # export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# # iTerm2 integration
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
