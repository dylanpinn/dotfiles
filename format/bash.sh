#!/usr/bin/env sh
#
# Format bash files.
#
# Will use configuration in .editorconfig file:
# - Use 2 spaces for indent.
# - Use bash style.
# - Switch cases will be indented.
# - Binary ops like && and | may start a line.

set -e

set home/dot_bashrc
set home/dot_bash_profile

shfmt --list --write --simplify -- "$@"

find . -type f -name "*.bash" | while IFS='' read -r line; do
  shfmt --list --write --simplify -- "$line"
done
