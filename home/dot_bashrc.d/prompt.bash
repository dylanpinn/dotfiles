function prompt_right() {
  echo -e "\033[0;36m\\\t\033[0m"
}

function prompt_left() {
  echo -e "\033[0;35m\W\033[0m"
}

function prompt() {
    compensate=5
    PS1=$(printf "%*s\r%s\$ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt
