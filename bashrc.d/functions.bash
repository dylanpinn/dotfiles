## FUNCTIONS

# Lazy load nvm
nvm() {
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  nvm "$@"
}

# Lazy load pyenv
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"            # Load pyenv shims and autocompletion.
  eval "$(command pyenv virtualenv-init -)" # Load pyenv virtualenv.
  pyenv "$@"
}

# Load JDK version.
# e.g. jdk 1.8; jdk 11
jdk() {
  version=$1
  JAVA_HOME=$(/usr/libexec/java_home -v"$version")
  export JAVA_HOME
  java -version
}

# Colourised man.
man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
