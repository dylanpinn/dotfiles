#!/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"
export ZSH=$DOTFILES/zsh

# default editor vim
export EDITOR='vim'

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# golang
export GOPATH="$HOME/dev/go"
export PATH="$PATH:$GOPATH/bin"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# fzf
## follow symbolic links, include hidden files and respect ignore
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Android SDK
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
