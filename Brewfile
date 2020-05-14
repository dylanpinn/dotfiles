# Taps

tap "homebrew/cask"
# tap "homebrew/cask-versions"

tap "thoughtbot/formulae"

# brew

brew "bash"     # use a newer version of bash.
brew "bash-completion@2"
brew "diff-so-fancy" # required by git
brew "git"
brew "rcm"
# brew "ripgrep"  # required for shell-fmt script.
brew "vim"

# Casks

cask "1password"
# cask "alfred"
# cask "dash"
cask "docker"
# cask "firefox-developer-edition"
# cask "imageoptim"
cask "rectangle"
cask "zoomus"

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  cask "slack"
end

# vim: set syntax=ruby:
