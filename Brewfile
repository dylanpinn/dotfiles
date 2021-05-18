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
# Reimplementation of ctags(1)
brew "ctags"
# Good-lookin' diffs with diff-highlight and more
brew "diff-so-fancy"
# Maintain consistent coding style between multiple editors
brew "editorconfig"
# Emacs
brew "d12frosted/emacs-plus/emacs-plus@27"
# Command-line tool to interact with exercism.io
brew "exercism"
# Simple, fast and user-friendly alternative to find
brew "fd"
# GitHub command-line tool
brew "gh"
# Distributed revision control system
brew "git"
# Graph visualization software from AT&T and Bell Labs
brew "graphviz"
# Improved top (interactive process viewer)
brew "htop"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Mac App Store command-line interface
brew "mas"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim", args: ["HEAD"]
# Python version management
brew "pyenv"
# Pyenv plugin to manage virtualenv
brew "pyenv-virtualenv"
# Ruby version manager
brew "rbenv"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Static analysis and lint tool, for (ba)sh scripts
brew "shellcheck"
# Autoformat shell script source code
brew "shfmt"
# Command-line interface for SQLite
brew "sqlite"
# Organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
# Text interface for Git repositories
brew "tig"
# Terminal multiplexer
brew "tmux"
# Vi 'workalike' with many additional features
brew "vim"
# Command-line interface to the WakaTime api
brew "wakatime-cli"
# Watch files and take action when they change
brew "watchman"

# Casks

# Password manager that keeps all passwords secure behind one password
cask "1password"
# AdoptOpenJDK OpenJDK (Java) Development Kit
cask "adoptopenjdk11"
# Application launcher and productivity software
cask "alfred"
# Application uninstaller
cask "appcleaner"
# API documentation browser and code snippet manager
cask "dash"
# App to build and share containerized applications and microservices
cask "docker"
# App for note taking, organizing, task lists, and archiving
# cask "evernote"
# Web browser
cask "firefox-developer-edition"
# Web browser
cask "google-chrome"
# Free and open-source media player
cask "iina"
# Tool to optimize images to a smaller size
cask "imageoptim"
# HTTP and GraphQL Client
cask "insomnia"
# JetBrains tools manager
cask "jetbrains-toolbox"
# App to write, plan, collaborate, and get organized
cask "notion"
# Knowledge base that works on top of a local folder of plain text Markdown files
# cask "obsidian"
# Move and resize windows using keyboard shortcuts or snap areas
cask "rectangle"
# Team communication and collaboration software
cask "slack"
# Music streaming service
cask "spotify"
# Mindmap and brainstorming app
cask "xmind-zen"
# Video communication and virtual meeting platform
cask "zoom"

# App Store
mas "Drafts", id: 1435957248
mas "Microsoft To Do", id: 1274495053
mas "Things", id: 904280696

# Custom per environment/workstation.

if ENV["HOMEBREW_PROFILE"] == "work"
  tap "cowbell/stuff", "git@git.realestate.com.au:cowbell/homebrew-stuff.git"

  # Official Amazon AWS command-line interface
  brew "awscli"
  brew "coursier/formulas/coursier"
  # Authenticate to REA AWS accounts
  brew "cowbell/stuff/rea-as"
  # Making SLiPs easy to use
  brew "cowbell/stuff/rea-slip-utils"
  # Cross-platform program for developing Haskell projects
  brew "haskell-stack"
  # Build tool for Scala projects
  brew "sbt"

  cask "homebrew/cask-versions/adoptopenjdk8"
  cask "dbeaver-community"
  cask "browserstacklocal"
  cask "figma"
  cask "firefox"
  cask "google-chrome-dev"
  # Password manager
  cask "lastpass"
  cask "microsoft-edge"
  cask "microsoft-edge-dev"
  cask "postico"
  # cask "safari-technology-preview"
  cask "sequel-pro"
  cask "tableplus"
  cask "visual-studio-code"

  mas "Keynote", id: 409183694
  mas "Slack", id: 803453959
end

if ENV["HOMEBREW_PROFILE"] == "personal"
  # Play, record, convert, and stream audio and video
  brew "ffmpeg"
  # Swiss-army knife of markup format conversion
  brew "pandoc"
  # Internet file retriever
  brew "wget"
  # Download YouTube videos from the command-line
  brew "youtube-dl"

  # Compact TeX distribution as alternative to the full TeX Live / MacTeX
  cask "basictex"
  # E-books management software
  cask "calibre"
  # Voice and text chat software
  cask "discord"
  # Launcher for *Epic Games* games
  cask "epic-games"
  cask "google-backup-and-sync"
  # Podcast platform
  cask "pocket-casts"
  # Peer to peer Bitorrent client
  cask "qbittorrent"
  # Video game digital distribution service
  cask "steam"
  # Desktop client for WhatsApp
  cask "whatsapp"
  # Collect, organize, cite, and share research sources
  cask "zotero"

  mas "Amphetamine", id: 937984704
  mas "Instapaper", id: 288545208
  mas "Instapaper Save", id: 1481302432
  mas "Kindle", id: 405399194
  mas "Messenger", id: 1480068668
  mas "Numbers", id: 409203825
end
