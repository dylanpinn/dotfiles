# ===========================================================#
#
# Personal $HOME/.bashrc for bash-3.0
# By Dylan Pinn
#
# ===========================================================#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
  . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi
