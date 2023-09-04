#!/usr/bin/env sh
#
# Lint Lua files.

set -e

luacheck .luacheckrc
