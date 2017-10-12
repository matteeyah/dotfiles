# dotfiles

Personal dotfiles

## Usage

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

Cleans (unlinks) all symlinks specified in `$SYMLINK_FILE`.

### Symlink

Symlinks configs specified in `$SYMLINK_FILE`.

### Update

Updates the dotfile repo: updates submodules and pulls new changes.

### Install

Installs packages specified by flags.

Usage:
```bash
usage setup.sh [-v] install [-srpe] [-h]

-e    install vim and plugins
-h    show this
-p    install python
-r    install ruby
-s    install system packages
-v    verbose output
```
## Configuration

The setup script is configured using environment variables and a couple of
plaintext files.

### Environment Variables

|Variable|Default|Function|
|:-:|:-:|:-:|
|SYMLINK_FILE|setup/symlinks|Specifies which file lists config files to be handled by `clean` and `symlink` _*_|
|APT_FILE|setup/install/apt|Specifies which file lists packages to be installed by apt on debian/ubuntu systems _**_|
|BREW_FILE|setup/install/brew|Specifies which file lists packages to be installed by brew on macOS systems _**_|
|CASK_FILE|setup/install/cask|Specifies which file lists packages to be installed by cask on macOS systems _**_|
|PYTHON_VERSION|latest stable|Specifies which python version is installed with `setup.sh install -p`|
|RUBY_VERSION|latest stable|Specifies which ruby version is installed with `setup.sh install -r`|

_*_ Uses the following format
```plain
config_file symlink
```
* `config_file` is relative to `pwd` (the dotfiles repo root)
* `symlink` is relative to `$HOME`

_**_ Newline separated
