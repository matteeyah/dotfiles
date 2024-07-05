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
- Install zinit - https://github.com/zdharma-continuum/zinit
  - `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
  - Make `zsh` your login shell with `chsh -s $(command -v zsh)`
- Install minpac - https://github.com/k-takata/minpac
  - `git clone git@github.com:k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac`
  - Open `vim`/`neovim` and install plugins with `:PackUpdate`
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
* gpg (mac only)
  - `ln -s ~/.dotfiles/config/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf`

## Packages

### Required

* asdf - Manage language runtimes - https://github.com/asdf-vm/asdf
  - `git clone git@github.com:asdf-vm/asdf.git ~/.asdf`
  - `asdf plugin add ruby`
      - `sudo apt install build-essential libssql-dev libreadline-dev zlib1g-dev libyaml-dev libpq-dev` (linux only)
* git - Version Control - https://github.com/git/git
* nvim - editor - https://github.com/neovim/neovim
* ripgrep - grep Replacment - https://github.com/BurntSushi/ripgrep
* zinit - zsh package manager - https://github.com/zdharma-continuum/zinit
* zsh - Shell - https://github.com/zsh-users/zsh
* pinentry-mac - Shell - https://github.com/GPGTools/pinentry

### Optional

* fzf - Fuzzy Completer - https://github.com/junegunn/fzf
* fd - find Replacement - https://github.com/sharkdp/fd
* bat - cat Replacement - https://github.com/sharkdp/bat
* github-copilot-cli - Shell AI - https://www.npmjs.com/package/@githubnext/github-copilot-cli
* delta - diff highlighting - https://github.com/dandavison/delta
* tmux - Terminal Multiplexer - https://github.com/tmux/tmux/
* docker - Container Engine - https://github.com/docker/docker-ce
