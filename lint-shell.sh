#!/usr/bin/env bash

set -e

# Shell configuration files.
shellcheck -s bash profile bash_profile bashrc

# Shell scripts in bin directory.
shellcheck -e SC1090 -s bash bin/git-divergence
shellcheck -e SC1090 -s bash bin/run-command-on-git-revisions
