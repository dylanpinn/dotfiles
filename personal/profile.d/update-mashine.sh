update-machine () {
  brew update
  brew upgrade
  brew upgrade --cask
  asdf plugin update --all
}
