#!/usr/bin/env sh
#
# Format shell files using shfmt.
#
# This uses .editorconfig to detect parser and printer flags.

set -eu

set sh/profile

shfmt --list --write --simplify -- "$@"

shfmt --list --write --simplify -- sh

find . -type f -name "*.sh" | while IFS='' read -r line; do
    shfmt --list --write --simplify -- "$line"
done
