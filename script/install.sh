#!/bin/sh

# Ensure homebrew installed on mac systems
ensure_brew() {
  if ! command -v brew && [ "${system}" = "darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

# Ensure curl is installed on linux systems
ensure_curl() {
  if ! command -v curl; then
    case "${system}" in
      "debian" | "ubuntu")
        sudo apt install -y curl
        ;;
    esac
  fi
}

# Ensure git is installed
ensure_git() {
  if ! command -v curl; then
    case "${system}" in
      "darwin")
        ensure_brew
        brew install git
        ;;
      "debian" | "ubuntu")
        sudo apt install -y git
        ;;
    esac
  fi
}

# Determine which system the script is running on
# Then install system pacakges using the appropriate package manager
packages() {
  echo "Installing system packages..."
  case "${system}" in
    "darwin")
      if [ -z "${BREW_FILE}" ]; then
        BREW_FILE="script/install/brew"
      fi

      if [ -z "${CASK_FILE}" ]; then
        CASK_FILE="script/install/cask"
      fi

      ensure_brew
      cat < "${BREW_FILE}" | xargs brew install
      cat < "${CASK_FILE}" | xargs brew cask install
      ;;
    "debian" | "ubuntu")
      if [ -z "${APT_FILE}" ]; then
        APT_FILE="script/install/apt"
      fi

      export DEBIAN_FRONTEND="noninteractive"
      sudo apt update
      cat < "${APT_FILE}" | xargs sudo apt install -y
      ;;
  esac
}

# Install ruby
ruby() {
  ensure_git

  echo "Installing rbenv..."
  if [ "${system}" = "darwin" ]; then
    ensure_brew
    # Install ruby dependencies
    brew install openssl libyaml libffi

    brew install rbenv
  elif [ "${system}" = "debian" ]; then
    # Install ruby dependencies
    sudo apt -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    sudo apt install -y rbenv
  fi

  # Install the ruby-build plugin for rbenv
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

  echo "Installing ruby..."
  if [ "${VERBOSE}" -eq 1 ]; then
    rbenv install --verbose "$2"
  else
    rbenv install "$1"
  fi
  rbenv global "$1"
}

# Install python
python() {
  echo "Installing pyenv..."
  if [ "${system}" = "darwin" ]; then
    ensure_brew
    # Install python dependencies
    brew install readline xz

    brew install git pyenv pyenv-virtualenvwrapper
  elif [ "${system}" = "debian" ]; then
    # Install python dependencies
    sudo apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

    sudo apt install -y git pyenv
    # Install the pyenv-virtualenvwrapper plugin for pyenv
    ensure_git
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "$(pyenv root)"/plugins/pyenv-virtualenvwrapper
  fi


  echo "Installing python..."
  if [ "${VERBOSE}" -eq 1 ]; then
    pyenv install --verbose "$2"
  else
    pyenv install "$1"
  fi
  pyenv global "$1"
}

# Install vim-plug
vim() {
  ensure_git
  ensure_curl

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
      if [ -z "${PYTHON_VERSION}" ]; then
        ruby 2.4.1
      else
        ruby "${PYTHON_VERSION}"
      fi
      ;;
    p)
      if [ -z "${RUBY_VERSION}" ]; then
        ruby 2.4.1
      else
        ruby "${RUBY_VERSION}"
      fi
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
