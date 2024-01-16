#!/usr/bin/env sh
#
# Lint vim files using vint.

set -eu

find vim -type f -exec vint {} +

find nvim -type f -name "*.vim" \
    -not -path "nvim/pack/bundle/*" \
    -exec vint {} +
