#!/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"
export ZSH=$DOTFILES/zsh

# default editor vim
export EDITOR='vim'

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# on MacOS dircolors is gdircolors with brew install coreutils
if command gdircolors --help >/dev/null; then
  alias dircolors="gdircolors"
fi
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# direnv
eval "$(direnv hook zsh)"

# pyenv
export PATH="/home/dylan/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Android SDK
# export ANDROID_HOME=${HOME}/Android/Sdk
# export PATH=${PATH}:${ANDROID_HOME}/emulator
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Tmuxinator auto-completions
# source ~/.bin/tmuxinator.zsh


# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/dylan/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dylan/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/dylan/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dylan/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Tiny Care Terminal
# export TTC_REPOS='~/dev/'
# export TTC_REPOS_DEPTH=5
# export TTC_WEATHER='Melbourne, Australia'
# export TTC_CONSUMER_KEY='zboltMx0TW6Q2uI2zXp0PqqpV'
# export TTC_CONSUMER_SECRET='IuIxBvHA3Rak9VMwGpmbm5XMdGlQKzLU3wqtaBboMsVjk05gKo'
# export TTC_ACCESS_TOKEN='215936015-Cb9UKRoWtLrcxi2FwNDwWGnHsMJzqgZ8IaX3uRA3'
# export TTC_ACCESS_TOKEN_SECRET='UWJubBVSyzA3SL8E4OeZcNk0e8yOCZNNt9ORJFTx4WAT4'

