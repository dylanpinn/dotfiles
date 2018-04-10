#!/usr/bin/env bash

echo -e "\\n\\nSetting up VSCode"
echo "======================="

# Symlink to more default dir if macOS
if [[ "$OSTYPE" == darwin* ]]; then
  ln -sf $HOME/.config/Code/User/*.json "$HOME/Library/Application Support/Code/User"
fi
