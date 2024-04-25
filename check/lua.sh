#!/usr/bin/env sh
#
# Check formatting for Lua files.

set -eu

stylua --check .luacheckrc .
