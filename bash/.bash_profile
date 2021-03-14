#!/usr/bin/env bash

# Load .profile, containing login, non-bash related initializations.
# shellcheck source=/dev/null
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
# shellcheck source=bash/.bashrc
source ~/.bashrc
