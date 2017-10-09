#!/bin/sh

# Update submodules
echo "Updating submodules..."
git submodule update --init --recursive

# Prune symlinks
echo "Pruning symlinks..."
find ~ -maxdepth 1 -type l -delete

# Create config symlinks
echo "Symlinking config files..."
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc

# Install stuff
echo "Installing packages..."
sh ./script/install.sh
echo "Installing ruby..."
sh ./script/ruby.sh
echo "Installign python..."
sh ./script/python.sh
echo "Installing vim plugins..."
sh ./script/vim.sh
