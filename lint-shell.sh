#!/usr/bin/env bash

set -e

shellcheck -e SC1090 -s bash profile bash_profile bashrc
