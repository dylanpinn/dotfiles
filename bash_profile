#!/usr/bin/env bash

# Load .profile, containing login, non-bash related initializations.
# shellcheck source=./profile
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
# shellcheck source=./bashrc
source ~/.bashrc

# Bash completion - TODO: See if needs to move to bashrc.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
