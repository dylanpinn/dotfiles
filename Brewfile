# Taps

tap "adoptopenjdk/openjdk"
tap "d12frosted/emacs-plus"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "thoughtbot/formulae"

# brew

# Bourne-Again SHell, a UNIX command interpreter
brew "bash"
# Programmable completion for Bash 4.2+
brew "bash-completion@2"
# Bash Automated Testing System
brew "bats-core"
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy"
# Maintain consistent coding style between multiple editors
brew "editorconfig"
# Emacs
brew "emacs-plus"
# Command-line tool to interact with exercism.io
brew "exercism"
# Simple, fast and user-friendly alternative to find
brew "fd"
# GitHub command-line tool
brew "gh"
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
# Command-line interface to the WakaTime api
brew "wakatime-cli"

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
cask "pocket-casts"
cask "rectangle"
cask "slack"
cask "spotify"
cask "xmind-zen"
cask "zoom"

# App Store
mas "Drafts", id: 1435957248
mas "Evernote Web Clipper", id: 1481669779
mas "Grammarly for Safari", id: 1462114288
mas "Things", id: 904280696
mas "Trello", id: 1278508951
mas "Twitter", id: 1482454543

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
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  cask "calibre"
  cask "google-backup-and-sync"
  cask "notion"
  cask "whatsapp"

  mas "Kindle", id: 405399194
end

# vim: set syntax=ruby:
