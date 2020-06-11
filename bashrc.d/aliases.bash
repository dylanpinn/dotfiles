## ALIASES

# Colorise ls
alias ls="ls -G"

# Run Jest tests against changed files.
alias test-changed='npx jest --findRelatedTests $(git diff --name-only master)'
alias lint-changed='npx eslint $(git diff --name-only master | grep "\.js$")'
