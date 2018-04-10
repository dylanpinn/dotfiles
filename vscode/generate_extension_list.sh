#!/usr/bin/env bash

echo -e "\\n\\nGenerating VSCode extensions"
echo "======================="

code --list-extensions > "$HOME/.dotfiles/vscode/extensions.txt"
