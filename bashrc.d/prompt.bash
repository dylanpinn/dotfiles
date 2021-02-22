# Prompt

# git prompt settings.
# shellcheck disable=SC2034
GIT_PS1_SHOWDIRTYSTATE=1 # staged '+', unstaged '*'
# shellcheck disable=SC2034
GIT_PS1_SHOWSTASHSTATE=1 # '$' something is stashed
# shellcheck disable=SC2034
GIT_PS1_SHOWUNTRACKEDFILES=1 # '%' untracked files
# shellcheck disable=SC2034
GIT_PS1_SHOWUPSTREAM="auto" # '<' behind, '>' ahead, '<>' diverged, '=' no difference
# shellcheck disable=SC2034
GIT_PS1_DESCRIBE_STYLE=default # more info when in a detached HEAD

PS1='\w$(__git_ps1)\$ '
