# Optional Shell Behaviour.

# Correct small errors in directory names given to the `cd` builtin
shopt -s cdspell
# Check that hashed commands still exist before running them
shopt -s checkhash
# Update LINES and COLUMNS after each command if necessary
shopt -s checkwinsize
# Put multi-line commands into one history entry
shopt -s cmdhist
# Include filenames with leading dots in pattern matching
shopt -s dotglob
# Enable extended globbing: !(foo), ?(bar|baz)...
shopt -s extglob
# Append history to $HISTFILE rather than overwriting it
shopt -s histappend
# If history expansion fails, reload the command to try again
shopt -s histreedit
# Load history expansion result as the next command, don't run them directly
shopt -s histverify
# Don't assume a word with a @ in it is a hostname
shopt -u hostcomplete
# Don't change newlines to semicolons in history
shopt -s lithist
# Don't complete a Tab press on an empty line with every possible command
shopt -s no_empty_cmd_completion
# Use programmable completion, if available
shopt -s progcomp
# Warn me if I try to shift nonexistent values off an array
shopt -s shift_verbose
# Don't search $PATH to find files for the `source` builtin
shopt -u sourcepath

# These options only exist since Bash 4.0-alpha
if ((BASH_VERSINFO[0] >= 4)) ; then

    # Correct small errors in directory names during completion
    shopt -s dirspell
    # Allow double-star globs to match files and recursive paths
    shopt -s globstar

    # Warn me about stopped jobs when exiting
    # Available since 4.0, but only set it if >=4.1 due to bug:
    # <https://lists.gnu.org/archive/html/bug-bash/2009-02/msg00176.html>
    if ((BASH_VERSINFO[1] >= 1)) ; then
        shopt -s checkjobs
    fi

    # Expand variables in directory completion
    # Only available since 4.3
    if ((BASH_VERSINFO[1] >= 3)) ; then
        shopt -s direxpand
    fi
fi
