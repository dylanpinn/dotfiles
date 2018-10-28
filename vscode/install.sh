#!/usr/bin/env bash

echo -e "\\n\\nSetting up VSCode"
echo "======================="

# Symlink to more default dir if macOS
if [[ "$OSTYPE" == darwin* ]]; then
  echo "Symlinking config to MacOS location..."
  ln -sf "$HOME/.config/Code/User/*.json" "$HOME/Library/Application Support/Code/User"
fi

if test "$(which code)"; then
  echo "Installing extensions..."
  # Generate this list with `code --list-extensions`
  filename="$DOTFILES/vscode/extensions.txt"
  while read -r line; do
    module="$line"
    code --install-extension "$module" --force || true
  done <"$filename"
fi
