#!/usr/bin/env bash

echo -e "\\n\\nGenerating VSCode extensions"
echo "======================="

code --list-extensions >"$DOTFILES/vscode/extensions.txt"
