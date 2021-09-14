#!/usr/bin/env bash
#
# Lint bash files.

set -e

set \
  bash/bashrc \
  bash/bash_profile \
  */bashrc.d/*.bash

shellcheck -e SC1090 -e SC1091 -s bash -- "$@"
