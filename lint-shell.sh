#!/usr/bin/env bash

set -e

shellcheck -s bash profile bash_profile bashrc bash_completion
shellcheck -s bash bash_completion.d/*
