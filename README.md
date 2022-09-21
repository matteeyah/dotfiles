# dotfiles

Personal dotfiles

## Usage

- Install brew - https://brew.sh/
  - Load `brew` in the current shell environment
    - `eval "$(/opt/homebrew/bin/brew shellenv)"`
- Set up ssh
  - Install OpenSSH - `brew install openssh` (only on macOS)
  - RSA SSH key
    - Download the public key to `~/.ssh/id_rsa.pub`
    - Download the private key to `~/.ssh/id_rsa`
  - ED25519-SK key
    - Download the public key to `~/.ssh/id_ed25519_sk.pub`
    - Download the private key to `~/.ssh/id_ed25519_sk`
  - Add the SSH key to the SSH agent
    - `eval $(ssh-agent)`
    - `ssh-add`
- Set up GPG
  - Install GPG - `brew install gpg` (only on macOS)
  - Download the public and private keys
  - Set up SmartCard Daemon (only on Linux)
    - https://blog.programster.org/yubikey-link-with-gpg
  - Import the public key - `gpg --import public.key`
  - Import the private key - `gpg --allow-secret-key-import --import private.key`
- Clone the dotfiles
  - `git clone git@github.com:matteeyah/dotfiles.git ~/.dotfiles`
- Install minpac - https://github.com/k-takata/minpac
  - `git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac`
- Set up the terminal profile
  - Download the `Zenburn` terminal config from the repo
    - https://github.com/matteeyah/dotfiles/blob/master/Zenburn.terminal
  - Set the default Terminal theme to `Zenburn`

This repo is structured as a symlink farm.

### Available Configurations

* git
  - `ln -s ~/.dotfiles/config/git/.gitconfig ~/.gitconfig`
* nvim
  - `ln -s ~/.dotfiles/config/vim/.vimrc ~/.config/nvim/init.vim`
* ssh
  - `ln -s ~/.dotfiles/config/ssh/config ~/.ssh/config`
* tmux
  - `ln -s ~/.dotfiles/config/tmux/.tmux.confg ~/.tmux.conf`
* zsh
  - `ln -s ~/.dotfiles/config/zsh/.zshrc ~/.zshrc`

## Packages

[Homebrew](https://github.com/Homebrew/brew) or
[Linuxbrew](https://github.com/Linuxbrew/brew)

### Required

#### brew

* asdf - Manage language runtimes - https://github.com/asdf-vm/asdf
* git - Version Control - https://github.com/git/git
* nvim - editor - https://github.com/neovim/neovim
* ripgrep - grep Replacment - https://github.com/BurntSushi/ripgrep
* zinit - zsh package manager - https://github.com/zdharma-continuum/zinit
* zsh - Shell - https://github.com/zsh-users/zsh

### Optional

#### brew

* fzf - Fuzzy Completer - https://github.com/junegunn/fzf
* fd - find Replacement - https://github.com/sharkdp/fd
* bat - cat Replacement - https://github.com/sharkdp/bat
* exa - ld Replacement -  https://github.com/ogham/exa
* delta - diff highlighting - https://github.com/dandavison/delta
* tmux - Terminal Multiplexer - https://github.com/tmux/tmux/
* stow - Symlink Farm Manager - https://www.gnu.org/software/stow/

#### cask

* font-fira-code - Font With Ligatures - https://github.com/tonsky/FiraCode
* docker - Container Engine - https://github.com/docker/docker-ce
