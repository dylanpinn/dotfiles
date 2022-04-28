#!/usr/bin/env sh
#
# Lint shell files.

set -e

set sh/profile

shellcheck -e SC1090 -s sh -- "$@"

find . -type f -name "*.sh" | while IFS='' read -r line; do
  shellcheck -e SC1090 -e SC1091 -s sh -- "$line"
done
