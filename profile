#!/usr/bin/env sh

# Set vim as default editor.
export EDITOR="vim"

# Add Golang bin to PATH.
# export PATH=$PATH:$(go env GOPATH)/bin

# Add dotfiles bin to PATH
export PATH="$HOME/.bin:$PATH"

# Set NVM directory.
export NVM_DIR="$HOME/.nvm"

# Add yarn to PATH.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# vim: set syntax=bash:
