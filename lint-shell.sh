#!/usr/bin/env bash

set -e

# Shell configuration files.
shellcheck -e SC1090 -s bash profile bash_profile bashrc
