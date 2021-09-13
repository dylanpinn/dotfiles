#!/usr/bin/env bash

# Check if packer has been setup
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/opt/packer.nvim" ]; then
  # If not install it
  git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
fi
