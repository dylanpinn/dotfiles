#!/usr/bin/env sh
#
# Lint vim files.

set -e

for v in vim/* ; do
  printf '%s\n' "$v"
  vint -s -- "$v"
done

