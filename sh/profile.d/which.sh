# Try to stop me using the non-standard `which`:
# <http://mywiki.wooledge.org/BadUtils#which>
which() {
    printf >&2 'Whichcraft detected! Did you mean: command -v %s\n' "$*"
    return 2
}
