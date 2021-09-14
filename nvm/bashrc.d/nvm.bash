#######################################
# Lazy load nvm.
# Globals:
#   NVM_DIR - this is the directory where nvm is installed. This is set by
#            ~/.profile.d/nvm.sh
# Arguments:
#   None
#######################################
function nvm() {
  # This loads nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  # This loads nvm bash_completion
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
