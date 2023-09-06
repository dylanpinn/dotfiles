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
      green=$(tput setaf 2)
      blue=$(tput setaf 4)
      bold=$(tput bold)
      reset=$(tput sgr0)
      PS1='\[$bold\[$green\]\u\[$reset\]:\[$bold\[$blue\]\w\[$reset\]\$ '
      ;;
    # Simple prompt.
    off)
      unset -v PROMPT_DIRTRIM
      PS1='$ '
      ;;
  esac
}

prompt on
