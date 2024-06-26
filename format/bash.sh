#!/usr/bin/env sh
#
# Format Bash files using shfmt.
#
# This uses .editorconfig to detect parser and printer flags.

set -eu

set bash/bashrc
set bash/bash_profile

shfmt --list --write --simplify -- "$@"

shfmt --list --write --simplify -- bash

find . -type f -name "*.bash" \
    -exec shfmt --list --write --simplify {} +
