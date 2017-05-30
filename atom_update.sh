atom_update() {
  local ATOM_LOCAL_VERSION
  local ATOM_BREW_VERSION
  echo "Updating Homebrew..."
  brew update 1>/dev/null || return $?
  ATOM_LOCAL_VERSION=`atom --version | grep Atom | cut -f 2 -d ':' | tr -d ' '`
  ATOM_BREW_VERSION=`brew cask info atom 2>/dev/null | head -n 1 | cut -f 2 -d ' '`
  echo "Local version: $ATOM_LOCAL_VERSION"
  echo "Homebrew version: $ATOM_BREW_VERSION"
  if [[ $ATOM_BREW_VERSION > $ATOM_LOCAL_VERSION ]]; then
    brew cask install --force atom || return $?
    rm -rf \
      $HOME/.atom/blob-store \
      $HOME/.atom/compile-cache \
      $HOME/.atom/recovery \
      $HOME/.atom/storage
  fi
  apm upgrade --confirm false
}
