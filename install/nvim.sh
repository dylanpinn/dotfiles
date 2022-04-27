#!/usr/bin/env bash
#
# Install Packer if not already installed.

XDG_DATA_HOME="$HOME"/.local/share
NVIM_DIR="${XDG_DATA_HOME}/nvim"

# Check if Packer has been installed.
if [ ! -d "${NVIM_DIR}/site/pack/" ]; then
  # If not install it
  (
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    $NVIM_DIR/site/pack/packer/start/packer.nvim
  )
fi
