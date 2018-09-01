# dotfiles

Personal dotfiles

## Usage

To set up the dotfiles just clone this repo and symlink the configurations that
you want.
```bash
git clone https://github.com/matteeyah/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

This repo is structured as a [GNU Stow](https://www.gnu.org/software/stow/)
symlink farm.

### Available Configurations

* git
* tmux
* zsh
* vim

## Packages

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
* lazygit - git GUI - https://github.com/jesseduffield/lazygit
* bat - cat Replacement - https://github.com/sharkdp/bat
* prettyping - ping Replacement - https://github.com/denilsonsa/prettyping
* tldr - Shell Command Usage Examples - https://github.com/tldr-pages/tldr

#### cask

* font-fira-code - Font With Ligatures - https://github.com/tonsky/FiraCode
* docker - Container Engine - https://github.com/docker/docker-ce
