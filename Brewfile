# Taps

tap "homebrew/cask"

tap "thoughtbot/formulae"

# brew

# Bourne-Again SHell, a UNIX command interpreter
brew "bash"
# Programmable completion for Bash 4.1+
brew "bash-completion@2"
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy" # required by git.
# Simple, fast and user-friendly alternative to find
brew "htop"
# Distributed revision control system
brew "git"
# Mac App Store command-line interface
brew "mas"
# RC file (dotfile) management
brew "rcm"
# Search tool like grep and The Silver Searcher
brew "ripgrep"  # required for shell-fmt script.
# Vi 'workalike' with many additional features
brew "vim"

# Casks

cask "1password"
# cask "alfred"
cask "appcleaner"
# cask "dash"
cask "docker"
cask "evernote"
cask "rectangle"
cask "zoomus"

# App Store
mas "Drafts", id: 1435957248
mas "Evernote Web Clipper", id: 1481669779
mas "Grammarly for Safari", id: 1462114288
mas "Todoist", id: 585829637

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  tap "homebrew/cask-versions"

  cask "firefox-developer-edition"
  cask "imageoptim"
  cask "slack"

  mas "Grammarly for Safari", id: 1462114288
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  cask "google-backup-and-sync"

  mas "LINER - Web / PDF Highlighter", id: 1463530746
end

# vim: set syntax=ruby:
