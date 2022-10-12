#######################################
# Create PR in GitHub using GitHub CLI.
# Globals:
#   None
# Arguments:
#   Branch to create the PR against.
#######################################
create-pr() {
  gh pr create --assignee @me --draft
}
