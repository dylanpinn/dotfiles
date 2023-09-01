#!/usr/bin/env bash
#
# Lint bash files.

set -e

# TODO: Find a way to remove this.
# shellcheck disable=SC2046
shellcheck -e SC1090 -e SC1091 -s bash -- $(find . -type f -name "*.bash")

# TODO: Find a way to remove this.
# shellcheck disable=SC2046
shellcheck -e SC1090 -e SC1091 -s bash -- $(find . -type f -name "*.sh" -path "./home/.chezmoiscripts/*")
