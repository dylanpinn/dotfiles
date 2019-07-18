#!/usr/bin/env bash

echo "Setting up dotfiles...."

echo "Symlinking dotfiles..."
# TODO: Check if rcup is installed
env RCRC="$HOME/.dotfiles/rcrc" rcup -v

# Setup VSCode config
. vscode/install.sh
