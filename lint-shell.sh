#!/usr/bin/env bash

set -e

shopt -s nullglob dotglob
shellcheck -s bash bash/**.{sh,bash,ksh,bashrc,bash_profile,bash_login,bash_logout,bash_completion}
shellcheck -s sh sh/**.{sh,ksh,profile}
