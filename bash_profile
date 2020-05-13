#!/usr/bin/env bash

# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc

# Bash completion - TODO: See if needs to move to bashrc.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
