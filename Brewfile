# Taps

tap "adoptopenjdk/openjdk"
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
# Python version management
brew "pyenv"
# Pyenv plugin to manage virtualenv
brew "pyenv-virtualenv"
# RC file (dotfile) management
brew "rcm"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# Vi 'workalike' with many additional features
brew "vim"

# Casks

cask "1password"
cask "adoptopenjdk11"
cask "alfred"
cask "appcleaner"
cask "dash"
cask "docker"
cask "evernote"
cask "firefox-developer-edition"
cask "google-chrome"
cask "iina"
cask "intellij-idea-ce"
cask "pocket-casts"
cask "rectangle"
cask "spotify"
cask "xmind-zen"
cask "zoomus"

# App Store
mas "Drafts", id: 1435957248
mas "Evernote Web Clipper", id: 1481669779
mas "Grammarly for Safari", id: 1462114288
mas "Things 3", id: 904280696

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  tap "cowbell/stuff", "git@git.realestate.com.au:cowbell/homebrew-stuff.git"

  # Official Amazon AWS command-line interface
  brew "awscli"
  # Authenticate to REA AWS accounts
  brew "cowbell/stuff/rea-as"
  # Making SLiPs easy to use
  brew "cowbell/stuff/rea-slip-utils"
  # Add GitHub support to git on the command-line
  brew "hub"
  # Build tool for Scala projects
  brew "sbt"

  cask "homebrew/cask-versions/adoptopenjdk8"
  cask "figma"
  cask "imageoptim"
  cask "lastpass"
  cask "slack"

  mas "Trello", id: 1278508951
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  tap "alexanderwillner/tap"

  # Simple read-only comand-line interface to your Things 3 database
  brew "things.sh"
  # Text interface for Git repositories
  brew "tig"

  cask "calibre"
  cask "epic-games"
  cask "google-backup-and-sync"
  cask "notion"
  cask "whatsapp"

  mas "Kindle", id: 405399194
  mas "Numbers", id: 409203825
end

# vim: set syntax=ruby:
