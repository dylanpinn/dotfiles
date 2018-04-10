#!/usr/bin/env bash

echo "Setting up dotfiles...."

echo "Symlinking dotfiles..."
# TODO: Check if rcup is installed
env RCRC=$HOME/.dotfiles/rcrc rcup -v

# Setup iterm2 config
# TODO: Check if using MacOS
. iterm2/install.sh

# Setup VSCode config
. vscode/install.sh
