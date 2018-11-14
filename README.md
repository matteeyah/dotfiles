# dotfiles

Personal dotfiles

## Usage

To set up the dotfiles just clone this repo and run the setup script.

```bash
git clone git@github.com:matteeyah/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

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
* antigen - Shell Configuration Manager - https://github.com/zsh-users/antigen
* stow - Symlink Farm Manager - https://www.gnu.org/software/stow/

### Optional

#### brew

* fzf - Fuzzy Completer - https://github.com/junegunn/fzf
* fd - find Replacement - https://github.com/sharkdp/fd
* bat - cat Replacement - https://github.com/sharkdp/bat
* prettyping - ping Replacement - https://github.com/denilsonsa/prettyping
* tldr - Shell Command Usage Examples - https://github.com/tldr-pages/tldr
* tree - Tree View For Directories - https://github.com/nodakai/tree-command

#### cask

* font-fira-code - Font With Ligatures - https://github.com/tonsky/FiraCode
* docker - Container Engine - https://github.com/docker/docker-ce
