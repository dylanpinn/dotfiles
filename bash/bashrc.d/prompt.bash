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
        # Save each command into history.
        PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

        # If Bash 4.0 is available, trim very long paths in prompt.
        if ((BASH_VERSINFO[0] >= 4)); then
            PROMPT_DIRTRIM=4
        fi

        PS1=
        PS1=$PS1'\w'

        # Use git-prompt (https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
        # Show working dirty state.
        export GIT_PS1_SHOWDIRTYSTATE=1

        # Add sub-modules
        ## job, and return status checks as suffixes
        PS1=$PS1'$(prompt job;prompt ret)'

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

    # Show the count of background jobs in curly brackets, if not zero
    job)
        local -i jobc
        while read -r; do
            ((jobc++))
        done < <(jobs -p)
        ((jobc)) || return
        printf '{%u}' "${jobc//\\/\\\\}"
        ;;

    # Show return status of previous command in angle brackets, if not zero
    ret)
        # shellcheck disable=SC2154
        ((PROMPT_RETURN)) || return
        printf '<%u>' "${PROMPT_RETURN//\\/\\\\}"
        ;;

    # Simple prompt.
    off)
        PS1='$ '
        PS2='> '
        PS3='? '
        PS4='+ '
        ;;
    esac
}

prompt on
