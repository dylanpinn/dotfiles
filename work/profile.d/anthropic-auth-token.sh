# --- rea ai-coding: Portkey ---
get_key_from_keychain() {
  local service="$1"
  security find-generic-password -a "$USER" -s "$service" -w 2>/dev/null
}

export PORTKEY_API_KEY="$(get_key_from_keychain PORTKEY_API_KEY)"
export ANTHROPIC_AUTH_TOKEN="$PORTKEY_API_KEY"
# --- end rea ai-coding ---
