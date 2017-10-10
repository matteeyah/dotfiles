#!/bin/bash

# Prune symlinks
clean() {
  echo "Pruning symlinks..."
  if [ $verbose -eq 1 ]; then
    find ~ -maxdepth 1 -type l -delete -print
  else
    find ~ -maxdepth 1 -type l -delete
  fi
}

# Update submodules
update() {
  echo "Updating submodules..."
  git submodule update --init --recursive
}

# Create config symlinks
symlink() {
  echo "Symlinking config files..."
  if [ $verbose -eq 1 ]; then
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
  ( VERBOSE=$verbose exec script/install.sh "$@" )
}

usage() {
  cat << EOF
usage: $0 [-v] <command> [-h]
-v    verbose output
-h    show this

commands:

clean        prunes symlinks
symlink      symlinks config files
update       updates dotifles repo
install      installs system packages
EOF
}

verbose=0
[ $# -eq 0 ] && usage

while getopts "vh" opt; do
  case $opt in
    v)
      verbose=1
      ;;
    h | *)
      usage
      exit 0
      ;;
  esac
done
shift $((OPTIND - 1))

while [ "$1" != "" ]; do
  case $1 in
    clean )                 clean
                            exit 0
      ;;
    update )                update
                            exit 0
      ;;
    symlink )               symlink
                            exit 0
      ;;
    install )               shift
                            install $@
                            exit 0
      ;;
    * )                     usage
                            exit 1
  esac
done

