# Read extra targets from an optional configuration file
conf=${XDG_CONFIG_HOME:-"$HOME"/.config}/dotfiles/config
if [ -e "$conf" ] ; then
    while read -r line ; do
        case $line in
            # Ignore comments and empty lines.
            '#'*|'') ;;
            *) set -- "$@" "$line" ;;
        esac
    done < "$conf"
fi
make install "$@"
