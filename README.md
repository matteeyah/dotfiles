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

Cleans (unlinks)  all symlinks specified in `configs`.

### Symlink

Symlinks configs specified in `configs`.

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
|PYTHON_VERSION|3.6.1|Specifies which python version is installed with `setup.sh install -p`|
|RUBY_VERSION|2.4.2|Specifies which ruby version is installed with `setup.sh install -r`|
|APT_FILE|script/install/apt|Specifies which file lists packages to be installed by apt on debian/ubuntu systems _*_|
|BREW_FILE|script/install/brew|Specifies which file lists packages to be installed by brew on mac systems _*_|
|CASK_FILE|script/install/cask|Specifies which file lists packages to be installed by cask on mac systems _*_|

_*: Newline separated_
