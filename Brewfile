# Taps

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/cask-versions"
tap "thoughtbot/formulae"

# brew

# Bourne-Again SHell, a UNIX command interpreter
brew "bash"
# Programmable completion for Bash 4.1+
brew "bash-completion@2"
# Bash Automated Testing System
brew "bats-core"
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy"
# Command-line tool to interact with exercism.io
brew "exercism"
# Distributed revision control system
brew "git"
# Improved top (interactive process viewer)
brew "htop"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Mac App Store command-line interface
brew "mas"
# RC file (dotfile) management
brew "rcm"
# Search tool like grep and The Silver Searcher
brew "ripgrep"  # required for shell-fmt script.
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# Vi 'workalike' with many additional features
brew "vim"

# Casks

cask "1password"
cask "alfred"
cask "appcleaner"
# cask "dash"
cask "docker"
cask "evernote"
cask "firefox-developer-edition"
cask "google-chrome"
cask "rectangle"
cask "xmind-zen"
cask "zoomus"

# App Store
mas "Drafts", id: 1435957248
mas "Evernote Web Clipper", id: 1481669779
mas "Grammarly for Safari", id: 1462114288
mas "Things 3", id: 904280696

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  tap "AdoptOpenJDK/openjdk"
  tap "cowbell/stuff", "git@git.realestate.com.au:cowbell/homebrew-stuff.git"

  # Official Amazon AWS command-line interface
  brew "awscli"
  # Authenticate to REA AWS accounts
  brew "cowbell/stuff/rea-as"
  # Making SLiPs easy to use
  brew "cowbell/stuff/rea-slip-utils"
  brew "sbt"

  cask "adoptopenjdk11"
  cask "intellij-idea-ce"
  cask "imageoptim"
  cask "slack"
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  cask "calibre"
  cask "google-backup-and-sync"
  cask "notion"

  mas "Kindle", id: 405399194
end

# vim: set syntax=ruby:
