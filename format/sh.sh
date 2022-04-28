#!/usr/bin/env sh
#
# Format shell files.

set -e

set sh/profile

shfmt -l -w -i 2 -ln posix -ci -bn -- "$@"

find . -type f -name "*.sh" | while IFS='' read -r line; do
  shfmt -l -w -i 2 -ln posix -ci -bn -- "$line"
done
