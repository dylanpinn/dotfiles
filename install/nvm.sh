#!/usr/bin/env bash
#
# Install nvm or update it if already installed.

XDG_DATA_HOME="$HOME"/.local/share
NVM_DIR="${XDG_DATA_HOME}/nvm"

# Check if NVM has been installed
if [ ! -d "$NVM_DIR" ]; then
  # If not install it
  (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  )
fi

(
  cd "$NVM_DIR"
  git fetch --tags origin
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
) && \. "$NVM_DIR/nvm.sh"

echo "nvm setup complete."
