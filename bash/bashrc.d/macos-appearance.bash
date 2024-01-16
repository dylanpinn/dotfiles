# Use $TERMCS to determine if macOS is using Dark or Light appearance setings.
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    export TERMCS="dark"
else
    export TERMCS="light"
fi
