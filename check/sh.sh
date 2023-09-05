#!/usr/bin/env sh
#
# Check syntax for sh files.

set -e

find . -type f -name "*.sh" | while IFS='' read -r line; do
  [ -f "$line" ] || continue
  sh -n -- "$line"
done

printf 'POSIX shell scripts parsed successfully.\n'
