#!/usr/bin/env bash
#
# Lint bash files.

set -e

set \
  bash/bashrc \
  bash/bash_profile

shellcheck -e SC1090 -e SC1091 -s bash -- "$@"

find . -type f -name "*.bash" | while IFS='' read -r line; do
  shellcheck -e SC1090 -e SC1091 -s bash -- "$line"
done
