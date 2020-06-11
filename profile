#!/usr/bin/env sh

# Set vim as default editor.
export EDITOR="vim"

# Add dotfiles bin to PATH
export PATH="$HOME/.bin:$PATH"

# Set NVM directory.
export NVM_DIR="$HOME/.nvm"

# Add yarn to PATH.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Move Wakatime config out of home directory.
export WAKATIME_HOME="$HOME/.config/wakatime"

# vim: set syntax=bash:
