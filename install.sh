#!/usr/bin/env bash

echo "Setting up dotfiles...."

echo "Symlinking dotfiles..."
# TODO: Check if rcup is installed
env RCRC="$HOME/.dotfiles/rcrc" rcup -v

# Setup iterm2 config
if [[ "$OSTYPE" == darwin* ]]; then
  . iterm2/install.sh
fi

# Setup VSCode config
. vscode/install.sh
