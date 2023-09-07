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
      # Set up pre-prompt command
      PROMPT_COMMAND='PROMPT_RETURN=$?;history -a'

      # If Bash 4.0 is available, trim very long paths in prompt.
      if ((BASH_VERSINFO[0] >= 4)); then
        PROMPT_DIRTRIM=4
      fi

      PS1=
      PS1=$PS1'\w'

      # Add a helpful prefix if this shell appears to be exotic
      case ${SHELL##*/} in
        bash) ;;
        *) PS1=bash:$PS1 ;;
      esac

      # Show working dirty state.
      export GIT_PS1_SHOWDIRTYSTATE=1

      # Add terminating "$" or "#" sign
      PS1=$PS1'\$'

      # Declare variables to contain terminal control strings
      local format reset

      # Disregard output and error from these tput(1) calls
      {
        # Prepare reset code
        reset=$(tput sgr0 || tput me)

        # Set colour to use non-bold green.
        format=$(tput setaf 2)

      } >/dev/null 2>&1

      # String it all together
      PS1='\['"$format"'\]'"$PS1"'\['"$reset"'\]$(__git_ps1) '
      PS2='> '
      PS3='? '
      PS4='+<$?> ${BASH_SOURCE:-$BASH}:${FUNCNAME[0]}:$LINENO:'
      ;;
    # Simple prompt.
    off)
      unset -v PROMPT_COMMAND PROMPT_DIRTRIM
      PS1='$ '
      PS2='> '
      PS3='? '
      PS4='+ '
      ;;
  esac
}

prompt on
