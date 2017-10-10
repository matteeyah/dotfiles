#!/bin/bash

# Determine which system the script is running on
# Then install system pacakges using the appropriate package manager
packages() {
  echo "Installing system packages..."
  if [[ "$OSTYPE" = "darwin"* ]]; then
    /bin/bash script/install/macos.sh
  elif [[ "$OSTYPE" = "linux-gnu" ]]; then
    case $(grep ^ID= /etc/os-release | cut -d = -f2) in
      debian|ubuntu)
        /bin/bash script/install/debian.sh
        ;;
    esac
  fi
}

# Install ruby
ruby() {
  echo "Installing ruby..."
  if [ $VERBOSE -eq 1 ]; then
    rbenv install --verbose 2.4.1
  else
    rbenv install 2.4.1
  fi
  rbenv global 2.4.1
}

# Install python
python() {
  echo "Installing python..."
  if [ $VERBOSE -eq 1 ]; then
    pyenv install --verbose 3.6.2
  else
    pyenv install 3.6.2
  fi
  pyenv global 3.6.2
}

# Install vim-plug
vim() {
  echo "Installing vim plugins..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Install plugins then exit
  vim +PlugInstall +qall
}

usage() {
  cat << EOF
usage setup.sh [-v] install [-srpe] [-h]
-v    verbose output
-h    show this

-s    install system packages
-r    install ruby
-p    install python
-e    install vim plugins
EOF
}

[ $# -eq 0 ] && usage

while getopts "srpeh" opt; do
  case $opt in
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
      exit 0
      ;;
  esac
done
shift $((OPTIND - 1))

[ $# -ne 0 ] && usage
