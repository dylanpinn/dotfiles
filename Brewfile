# Taps

tap "homebrew/cask"

tap "d12frosted/emacs-plus"
tap "thoughtbot/formulae"

# brew

brew "bash"     # use a newer version of bash.
brew "bash-completion@2"
brew "diff-so-fancy" # required by git.
brew "emacs-plus"
brew "fd" # required by doom-emacs.
brew "git"
brew "rcm"
brew "ripgrep"  # required for shell-fmt script and doom-emacs.
brew "vim"

# Casks

cask "1password"
# cask "alfred"
# cask "dash"
cask "docker"
cask "rectangle"
cask "zoomus"

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  tap "homebrew/cask-versions"

  cask "firefox-developer-edition"
  cask "imageoptim"
  cask "slack"
end

# vim: set syntax=ruby:
