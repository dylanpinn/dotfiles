#!/usr/bin/env sh
#
# Format shell files.
#
# Will use configuration in .editorconfig file:
# - Use 2 spaces for indent.
# - Use POSIX style.
# - Switch cases will be indented.
# - Binary ops like && and | may start a line.

set -e

set home/dot_profile

shfmt -l -w -- "$@"

find . -type f -name "*.sh" | while IFS='' read -r line; do
  shfmt -l -w -- "$line"
done
