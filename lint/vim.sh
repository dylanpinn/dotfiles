#!/usr/bin/env sh
#
# Lint vim files.

set -e

# TODO: Find a way to remove this.
# shellcheck disable=SC2046
vint -s -- $(find vim -type f)
