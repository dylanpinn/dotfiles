#!/usr/bin/env bash
#
# Install nvim package manager if not already installed.

XDG_DATA_HOME="$HOME"/.local/share
NVIM_DIR="${XDG_DATA_HOME}/nvim"
PAQ_DIR="${NVIM_DIR}/site/pack/paqs/start/paq-nvim"

# Check if Paq has been installed
if [ ! -d "$PAQ_DIR" ]; then
  # If not install it
  (
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
      "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
  )
fi
