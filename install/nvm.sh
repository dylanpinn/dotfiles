#!/usr/bin/env bash

NVM_DIR="${XDG_DATA_HOME:$HOME/.local/share}/nvm"
# Check if NVM has been installed
if [ ! -d "$NVM_DIR" ]; then
  # If not install it
  (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  )
fi

# shellcheck source=/dev/null
(
  cd "$NVM_DIR"
  git fetch --tags origin
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
) && \. "$NVM_DIR/nvm.sh"
echo "nvm setup"
