# Taps

tap "homebrew/cask"

tap "d12frosted/emacs-plus"
tap "thoughtbot/formulae"

# brew

# Bourne-Again SHell, a UNIX command interpreter
brew "bash"
# Programmable completion for Bash 4.1+
brew "bash-completion@2"
# GNU File, Shell, and Text utilities
brew "coreutils" # required for doom-emacs.
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy" # required by git.
# GNU Emacs text editor
brew "d12frosted/emacs-plus/emacs-plus"
# Simple, fast and user-friendly alternative to find
brew "fd" # required by doom-emacs.
# Improved top (interactive process viewer)
brew "htop"
# Distributed revision control system
brew "git"
# RC file (dotfile) management
brew "rcm"
# Search tool like grep and The Silver Searcher
brew "ripgrep"  # required for shell-fmt script and doom-emacs.
# Vi 'workalike' with many additional features
brew "vim"

# Casks

cask "1password"
# cask "alfred"
cask "appcleaner"
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
