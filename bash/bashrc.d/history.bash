# Bash History

# Move history file out of $HOME directory
export HISTFILE="$XDG_STATE_HOME"/bash/history

# Increase history size.
HISTFILESIZE=1000000
HISTSIZE=1000000

# Ignore duplicates and commands that begin with whitespace.
HISTCONTROL=ignoreboth:erasedups

# Ignore certain commands.
HISTIGNORE='ls:bg:fg:history'
