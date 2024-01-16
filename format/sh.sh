#!/usr/bin/env sh
#
# Format shell files using shfmt.
#
# This uses .editorconfig to detect parser and printer flags.

set -eu

set sh/profile

shfmt --list --write --simplify -- "$@"

shfmt --list --write --simplify -- sh

find . -type f -name "*.sh" \
    -not -path "./nvim/pack/bundle/*" \
    -exec shfmt --list --write --simplify {} +
