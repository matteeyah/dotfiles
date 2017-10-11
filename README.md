# dotfiles

Personal dotfiles

## Getting set up

To set up the dotfiles just clone this repo and run the appropriate setup script commands.
```bash
git clone https://github.com/cmattrex/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

Usage:
```bash
usage: setup.sh [-v] <command> [-h]
-h    show this
-v    verbose output

commands:

clean        prunes symlinks
symlink      symlinks config files
update       updates dotifles repo
install      installs system packages
```

### Clean

Cleans all symlinks from the home folder.

### Symlink

Symlinks configs to the home folder.

### Update

Updates the dotfile repo.

### Install

Installs packages specified by flags.

Usage:
```bash
usage setup.sh [-v] install [-srpe] [-h]

-e    install vim plugins
-h    show this
-p    install python
-r    install ruby
-s    install system packages
-v    verbose output
```
## Options

### Python

You specify which version of python is going to be installed by `setup.sh
install -p` by setting the `PYTHON_VERSION` environment variable.

### Ruby

You specify which version of ruby is going to be installed by `setup.sh
install -r` by setting the `RUBY_VERSION` environment variable.

### Package Lists

You can specify the location of the file containing a list of packages to be
installed with `setup.sh install -s` by setting the `APT_FILE`, `BREW_FILE`
and/or `CASK_FILE` environment variables.
