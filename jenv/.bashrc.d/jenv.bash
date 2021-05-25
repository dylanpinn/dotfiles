# Lazy load jenv
function jenv() {
  unset -f jenv
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(command jenv init -)"
  jenv "$@"
}

