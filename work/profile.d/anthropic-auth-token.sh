get_key_from_keychain() {
  local service="$1"
  security find-generic-password -a "$USER" -s "$service" -w 2>/dev/null
}

export ANTHROPIC_AUTH_TOKEN="$(get_key_from_keychain PORTKEY_API_KEY)"
