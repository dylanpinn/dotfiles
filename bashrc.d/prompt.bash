# Prompt

# If Bash 4.0 is available, trim very long paths in prompt
if ((BASH_VERSINFO[0] >= 4)) ; then
  PROMPT_DIRTRIM=4
fi

# git prompt settings.
GIT_PS1_SHOWDIRTYSTATE=1       # staged '+', unstaged '*'
GIT_PS1_SHOWSTASHSTATE=1       # '$' something is stashed
GIT_PS1_SHOWUNTRACKEDFILES=1   # '%' untracked files
GIT_PS1_SHOWUPSTREAM="auto"    # '<' behind, '>' ahead, '<>' diverged, '=' no difference
GIT_PS1_DESCRIBE_STYLE=default # more info when in a detached HEAD

prompt_jobs() {
  local jobc
  while read -r _; do
    ((jobc++))
  done < <(jobs -p)
  if ((jobc > 0)); then
    printf '{%d}' "$jobc"
  fi
}

# ~/pwd(git-branch){job-count}$
prompt_on() {
  PS1=
  PS1=$PS1"\w"
  PS1=$PS1'$(__git_ps1)'
  PS1=$PS1'$(prompt_jobs)'
  PS1=$PS1'\$'
  PS1=$PS1' '

  local color_prompt
  color_prompt=$(tput bold)
  # Set colour to TEAL.
  color_prompt=$color_prompt$(tput setaf 6)
  local color_reset
  color_reset=$(tput sgr0)

  PS1="\\[$color_prompt\\]$PS1\\[$color_reset\\]"
}

# $
prompt_off() {
  PS1='\$'
  PS1=$PS1' '
}

prompt_on
