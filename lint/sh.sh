#!/usr/bin/env sh
#
# Lint shell files.

set -e

set sh/profile

shellcheck -e SC1090 -s sh -- "$@"

# TODO: Find a way to remove this.
# shellcheck disable=SC2046
shellcheck -e SC1090 -e SC1091 -s sh -- $(find . -type f -name "*.sh" -not -path "./node_modules/*" -not -path "./.husky/_/*" -not -path "./home/.chezmoiscripts/*")
