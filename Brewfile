# Taps

tap "adoptopenjdk/openjdk"
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
# Reimplementation of ctags(1)
brew "ctags"
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy"
# Command-line tool to interact with exercism.io
brew "exercism"
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
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# Python version management
brew "pyenv"
# Pyenv plugin to manage virtualenv
brew "pyenv-virtualenv"
# Ruby version manager
brew "rbenv"
# RC file (dotfile) management
brew "rcm"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# Autoformat shell script source code
brew "shfmt"
# Vi 'workalike' with many additional features
brew "vim"
# Internet file retriever
brew "wget"

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
cask "insomnia"
cask "intellij-idea-ce"
cask "pocket-casts"
cask "rectangle"
cask "slack"
cask "spotify"
cask "xmind-zen"
cask "zoomus"

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
  # Watch files and take action when they change
  brew "watchman"

  cask "homebrew/cask-versions/adoptopenjdk8"
  cask "dbeaver-community"
  cask "browserstacklocal"
  cask "figma"
  cask "imageoptim"
  cask "lastpass"
  cask "screen"
  cask "visual-studio-code"

  mas "Keynote", id: 409183694
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  tap "alexanderwillner/tap"

  # Play, record, convert, and stream audio and video
  brew "ffmpeg"
  # Text interface for Git repositories
  brew "tig"
  # Download YouTube videos from the command-line
  brew "youtube-dl"
  # Simple read-only comand-line interface to your Things 3 database
  brew "alexanderwillner/tap/things.sh"

  cask "calibre"
  cask "discord"
  cask "epic-games"
  cask "google-backup-and-sync"
  cask "notion"
  cask "qbittorrent"
  cask "whatsapp"

  mas "Amphetamine", id: 937984704
  mas "Broken Age", id: 621712754
  mas "Day of the Tentacle Remastered", id: 1094931305
  mas "Full Throttle Remastered", id: 1230268291
  mas "Grim Fandango", id: 1022841309
  mas "Kindle", id: 405399194
  mas "Messenger", id: 1480068668
  mas "Microsoft To Do", id: 1274495053
  mas "Numbers", id: 409203825
end

# vim: set syntax=ruby:
