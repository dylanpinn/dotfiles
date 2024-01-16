# Set-up bash prompt.
#
# TODO: Add a comment explaining what is happening.

#######################################
# Control bash prompt
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
        PS1=
        PS1=$PS1'\w'
        # Add terminating "$" or "#" sign
        PS1=$PS1'\$ '
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
