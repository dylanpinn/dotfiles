#!/usr/bin/env sh
#
# Lint vim files.

set -e

find vim -type f | while IFS='' read -r line
do
  printf '%s\n' "$line"
  vint -s -- "$line"
done
