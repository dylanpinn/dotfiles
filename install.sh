#!/usr/bin/env bash

echo "Setting up dotfiles...."

echo "Symlinking dotfiles..."
# TODO: Check if rcup is installed
env RCRC="$HOME/.dotfiles/rcrc" rcup -v

# Setup VSCode config
. vscode/install.sh

yarn install

# Setup iterm2
# TODO: Only when on macOS.
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
