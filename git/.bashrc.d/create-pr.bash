# Create PR in GitHub using GitHub CLI.

create-pr() {
  gh pr create -f -a @me -d -B "$1"
}
