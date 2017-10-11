#!/bin/sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh
brew install git
brew install tig
brew install rbenv
brew install pyenv
brew install pyenv-virtualenvwrapper
brew install tmux
brew install vim

brew cask install font-fira-code
brew cask install docker
