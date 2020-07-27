## FUNCTIONS

# Lazy load nvm
nvm() {
  # shellcheck source=/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
  # shellcheck source=/dev/null
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  nvm "$@"
}

# Load JDK version.
# e.g. jdk 1.8; jdk 11
jdk() {
  version=$1
  JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  export JAVA_HOME
  java -version
}
