<<<<<<< HEAD
# Prompt

# ~/pwd(git-branch)$
# TODO: Replace with native PS1 and implement colours that way.
# PROMPT_COMMAND='__git_ps1 "\n\w" "\$ " "(%s)"'
PS1=
PS1=$PS1"\w"
PS1=$PS1'$(__git_ps1)'
PS1=$PS1'\$ '
GIT_PS1_SHOWDIRTYSTATE=1       # staged '+', unstaged '*'
GIT_PS1_SHOWSTASHSTATE=1       # '$' something is stashed
GIT_PS1_SHOWUNTRACKEDFILES=1   # '%' untracked files
GIT_PS1_SHOWUPSTREAM="auto"    # '<' behind, '>' ahead, '<>' diverged, '=' no difference
GIT_PS1_DESCRIBE_STYLE=default # more info when in a detached HEAD
# GIT_PS1_SHOWCOLORHINTS=1       # Display colours in PROMPT_COMMAND
