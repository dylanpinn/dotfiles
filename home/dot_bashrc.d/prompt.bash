#######################################
# Setup bash prompt
# Globals:
#   PS1
# Arguments:
#   Control argument for prompt.
#######################################
function prompt() {
  # First argument determines what to do.
  case $1 in
    # Full featured prompt.
    on)
      # If Bash 4.0 is available, trim very long paths in prompt.
      if ((BASH_VERSINFO[0] >= 4)); then
        PROMPT_DIRTRIM=4
      fi

      # Set prompt to be user:~/pwd$
      # - user is bold green
      # - path is bold blue
      PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      ;;
    # Simple prompt.
    off)
      unset -v PROMPT_DIRTRIM
      PS1='$ '
      ;;
  esac
}

prompt on
