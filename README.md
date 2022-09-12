# dotfiles

Personal dotfiles

## Usage

- Install brew - https://brew.sh/
- Set up ssh
  - Install OpenSSH - `brew install openssh`
  - Download the public key to `~/.ssh/id_rsa.pub`
  - Download the private key to `~/.ssh/id_rsa`
- Set up GPG
  - Install GPG - `brew install gpg`
  - Download the public and private keys
  - Import the public key - `gpg --import public.key`
  - Import the private key - `gpg --allow-secret-key-import --import private.key`
- Clone the dotfiles
  - `git clone git@github.com:matteeyah/dotfiles.git ~/.dotfiles`
- Run the setup script
- Install minpac - https://github.com/k-takata/minpac
  - `git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac`
- Set up the terminal profile
  - Set the theme to `Zenburn`
  - Set the font to `Fira Code Regular 16`

This repo is structured as a [GNU Stow](https://www.gnu.org/software/stow/)
symlink farm.

### Internals

The script uses this README to figure out which packages to install and which
files to symlink. Because of this the format of this README should always
stay the same.

If you want to add a symlink or package, please add it to the README following
the already defined format.

### Available Configurations

* git
* tmux
* zsh
* vim

## Packages

[Homebrew](https://github.com/Homebrew/brew) or
[Linuxbrew](https://github.com/Linuxbrew/brew)

### Required

#### brew

* zsh - Shell - https://github.com/zsh-users/zsh
* git - Version Control - https://github.com/git/git
* ripgrep - grep Replacment - https://github.com/BurntSushi/ripgrep
* tmux - Terminal Multiplexer - https://github.com/tmux/tmux/
* stow - Symlink Farm Manager - https://www.gnu.org/software/stow/

### Optional

#### brew

* fzf - Fuzzy Completer - https://github.com/junegunn/fzf
* fd - find Replacement - https://github.com/sharkdp/fd
* bat - cat Replacement - https://github.com/sharkdp/bat
* exa - ld Replacement -  https://github.com/ogham/exa
* delta - diff highlighting - https://github.com/dandavison/delta

#### cask

* font-fira-code - Font With Ligatures - https://github.com/tonsky/FiraCode
* docker - Container Engine - https://github.com/docker/docker-ce
