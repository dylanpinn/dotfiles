#!/usr/bin/env bash

# Check if packer has been setup
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/opt/packer" ]; then
  # If not install it
  git clone https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
