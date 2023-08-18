update_machine () {
  brew update
  brew upgrade
  brew upgrade --cask
  rea --disable-auto-update cli update
  asdf plugin-update --all
  # mas upgrade
}
