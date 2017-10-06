# dotfiles

Personal dotfiles

## Installation

To install the dotfiles just clone this repo and run the setup script.
```bash
git clone https://github.com/cmattrex/dotfiles ~/.dotfiles
cd ~/.dotfiles
sh setup.sh
```

## Updating

Update by updating submodules and pulling the latest changes.
```bash
git submodule update --recursive --remote
git pull
```

### Installation updates

* If there's an update to the package install list, you'll need to run `./script/install.sh` manually.
* If there's an update for the ruby or python installations, you'll need to run `./script/ruby.sh` and/or `./script/python.sh` manually.
* If there's an update to the list of vim plugins, you'll need to run `:PlugUpdate` then `:PlugClean` from within vim.
