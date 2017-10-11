#!/bin/sh

# Prune symlinks
clean() {
  echo "Pruning symlinks..."
  if [ "${verbose}" -eq 1 ]; then
    find ~ -maxdepth 1 -type l -delete -print
  else
    find ~ -maxdepth 1 -type l -delete
  fi
}

# Update dotfiles repo
update() {
  echo "Updating..."
  git submodule update --init --recursive
  git pull
}

# Create config symlinks
symlink() {
  echo "Symlinking config files..."
  if [ "${verbose}" -eq 1 ]; then
    ln -s -v ~/.dotfiles/zsh/zshrc ~/.zshrc
    ln -s -v ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s -v ~/.dotfiles/vim/vimrc ~/.vimrc
  else
    ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
    ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
  fi
}

# Install stuff
install() {
  VERBOSE="${verbose}" exec script/install.sh "$@"
}

usage() {
  cat << EOF
usage: $0 [-v] <command> [-h]
-h    show this
-v    verbose output

commands:

clean        prunes symlinks
symlink      symlinks config files
update       updates dotifles repo
install      installs system packages
EOF
}

verbose=0
[ "$#" -eq 0 ] && usage && exit 1

while getopts "vh" opt; do
  case "${opt}" in
    v)
      verbose=1
      ;;
    h | *)
      usage
      exit 1
      ;;
  esac
done
shift "$((OPTIND - 1))"

case "$1" in
  clean)
    shift
    [ "$#" -ne 0 ] && usage && exit 1
    clean
    exit 0
    ;;
  update)
    shift
    [ "$#" -ne 0 ] && usage && exit 1
    update
    exit 0
    ;;
  symlink)
    shift
    [ "$#" -ne 0 ] && usage && exit 1
    symlink
    exit 0
    ;;
  install)
    shift
    install "$@"
    exit 0
    ;;
  *)
    usage
    exit 1
esac
