#!/usr/bin/env sh
#
# Lint lua files using luacheck.

set -eu

luacheck .luacheckrc .
