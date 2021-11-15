#!/usr/bin/env bash
#
# Setup NeoVim package manager Packer
# https://github.com/wbthomason/packer.nvim

# Check if packer has already been installed
if [ ! -d "$XDG_DATA_HOME/nvim/site/pack/packer/opt/packer.nvim" ]; then
  # If not install it
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	  "$XDG_DATA_HOME"/nvim/site/pack/packer/opt/packer.nvim
fi

echo "NeoVim successfully setup."

