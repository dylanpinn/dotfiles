# Prompt

# If Bash 4.0 is available, trim very long paths in prompt
if ((BASH_VERSINFO[0] >= 4)); then
  PROMPT_DIRTRIM=4
fi

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

PROMPT_SHOW_NVM=0
function check_prompt() {
  if hash node 2>/dev/null; then
    PROMPT_SHOW_NVM=1
  fi
}

# activating it
export PROMPT_COMMAND=check_prompt

prompt_jobs() {
  local jobc
  while read -r _; do
    ((jobc++))
  done < <(jobs -p)
  if ((jobc > 0)); then
    printf '{%d}' "$jobc"
  fi
}

function __node() {
  if [[ $PROMPT_SHOW_NVM = 1 ]]; then
    local v
    v=$(node -v)
    [ "$v" != "" ] && echo "[n:${v:1}]"
  fi
}

# ~/pwd(git-branch){job-count}[versions]$
prompt_on() {
  PS1=
  PS1=$PS1"\w"
  PS1=$PS1'$(__git_ps1)'
  PS1=$PS1'$(prompt_jobs)'
  PS1=$PS1'$(__node)'
  PS1=$PS1'\$'
  PS1=$PS1' '

  local color_prompt
  color_prompt=$(tput bold)
  # Set colour to TEAL.
  color_prompt=$color_prompt$(tput setaf 6)
  local color_reset
  color_reset=$(tput sgr0)

  export PS1="\\[$color_prompt\\]$PS1\\[$color_reset\\]"
}

# $
prompt_off() {
  PS1='\$'
  PS1=$PS1' '
  export PS1
}

prompt_on
