#!/bin/sh

# Ensure homebrew is installed on mac systems
ensure_brew() {
  if ! command -v brew && [ "${system}" = "darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

# Ensure a package is installed
ensure() {
  if [ "${system}" = "darwin" ]; then
    ensure_brew
  fi

  while [ "$#" -ne 0 ]; do
    if ! command -v "$1"; then
      case "${system}" in
        "darwin")
          brew install "$1"
          ;;
        "debian" | "ubuntu")
          sudo apt install -y "$1"
          ;;
      esac
    fi
    shift
  done
}

# Determine which system the script is running on
# Then install system pacakges using the appropriate package manager
packages() {
  echo "Installing system packages..."
  case "${system}" in
    "darwin")
      if [ -z "${BREW_FILE}" ]; then
        BREW_FILE="setup/install/brew"
      fi

      if [ -z "${CASK_FILE}" ]; then
        CASK_FILE="setup/install/cask"
      fi

      ensure_brew
      cat < "${BREW_FILE}" | xargs brew install
      cat < "${CASK_FILE}" | xargs brew cask install
      ;;
    "debian" | "ubuntu")
      if [ -z "${APT_FILE}" ]; then
        APT_FILE="setup/install/apt"
      fi

      export DEBIAN_FRONTEND="noninteractive"
      sudo apt update
      cat < "${APT_FILE}" | xargs sudo apt install -y
      ;;
  esac
}

# Install ruby
ruby() {
  echo "Installing rbenv..."
  if [ "${system}" = "darwin" ]; then
    ensure_brew
    # Install ruby dependencies
    ensure openssl libyaml libffi

    brew install rbenv
  elif [ "${system}" = "debian" ]; then
    # Install ruby dependencies
    ensure autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    sudo apt install -y rbenv
    # Install the ruby-build plugin for rbenv
    ensure git
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  fi


  echo "Installing ruby..."
  if [ -z "${RUBY_VERSION}" ]; then
    RUBY_VERSION="$(rbenv install -l | grep -v - | tail -1)"
  fi

  if [ "${VERBOSE}" -eq 1 ]; then
    rbenv install --verbose "${RUBY_VERSION}"
  else
    rbenv install "${RUBY_VERSION}"
  fi
  rbenv global "${RUBY_VERSION}"
}

# Install python
python() {
  echo "Installing pyenv..."
  if [ "${system}" = "darwin" ]; then
    ensure_brew
    # Install python dependencies
    ensure readline xz

    brew install pyenv pyenv-virtualenvwrapper
  elif [ "${system}" = "debian" ]; then
    # Install python dependencies
    ensure make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

    sudo apt install -y pyenv
    # Install the pyenv-virtualenvwrapper plugin for pyenv
    ensure git
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "$(pyenv root)"/plugins/pyenv-virtualenvwrapper
  fi

  echo "Installing python..."
  if [ -z "${PYTHON_VERSION}" ]; then
    PYTHON_VERSION="$(pyenv install -l | grep -v - | grep -v -E "a|b|rc")"
  fi

  if [ "${VERBOSE}" -eq 1 ]; then
    pyenv install --verbose "${PYTHON_VERSION}"
  else
    pyenv install "${PYTHON_VERSION}"
  fi
  pyenv global "${PYTHON_VERSION}"
}

# Install vim-plug
vim() {
  ensure git
  ensure curl

  echo "Installing vim..."
  if [ "${system}" = "darwin" ]; then
    ensure_brew
    brew install vim
  elif [ "${system}" = "debian" ]; then
    sudo apt install -y "vim"
  fi

  echo "Installing vim plugins..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Install plugins then exit
  vim +PlugInstall +qall
}

usage() {
  cat << EOF
usage setup.sh [-v] install [-srpe] [-h]

-e    install vim and plugins
-h    show this
-p    install python
-r    install ruby
-s    install system packages
-v    verbose output
EOF
}

[ "$#" -eq 0 ] && usage && exit 1

unamestr="$(uname)"
if [ "${unamestr}" = "Darwin" ]; then
  system="darwin"
elif [ "${unamestr}" = "Linux" ]; then
  system="$(grep ^ID= /etc/os-release | cut -d = -f2)" in
fi

while getopts "srpeh" opt; do
  case "${opt}" in
    s)
      packages
      ;;
    r)
      ruby
      ;;
    p)
      python
      ;;
    e)
      vim
      ;;
    h | *)
      usage
      exit 1
      ;;
  esac
done
shift "$((OPTIND - 1))"
[ "$#" -ne 0 ] && usage && exit 1
