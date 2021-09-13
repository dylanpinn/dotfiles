# Create PR in GitHub using GitHub CLI.

create-pr() {
  gh pr create --fill --assignee @me --draft --base "$1"
}
