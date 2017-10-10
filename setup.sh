#!/bin/bash

# Prune symlinks
clean() {
    echo "Pruning symlinks..."
    find ~ -maxdepth 1 -type l -delete
}

# Update submodules
update() {
    echo "Updating submodules..."
    git submodule update --init --recursive
}

# Create config symlinks
symlink() {
    echo "Symlinking config files..."
    ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
    ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
}

# Install stuff
install() {
    echo "Installing packages..."
    sh ./script/install.sh
    echo "Installing ruby..."
    sh ./script/ruby.sh
    echo "Installign python..."
    sh ./script/python.sh
    echo "Installing vim plugins..."
    sh ./script/vim.sh
}

usage() {
  cat << EOF
usage: $0 [-cusih]
-c     clean symlinks
-u     update dotfiles repo
-s     symlink config files
-i     install system packages
-h     show this
EOF
}

[ $# -eq 0 ] && usage
while getopts "cusih" opt; do
  case $opt in
    c)
      clean
      ;;
    u)
      update
      ;;
    s)
      symlink
      ;;
    i)
      install
      ;;
    h | *)
      usage
      exit 0
      ;;
  esac
done
shift $((OPTIND - 1))

[ $# -ne 0 ] && usage
