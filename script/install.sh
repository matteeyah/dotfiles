#!/bin/bash

# Determine which system the script is running on
# Then install system pacakges using the appropriate package manager
if [[ "$OSTYPE" = "darwin"* ]]; then
    /bin/bash script/install/macos.sh
elif [[ "$OSTYPE" = "linux-gnu" ]]; then
    case $(grep ^ID= /etc/os-release | cut -d = -f2) in
        debian|ubuntu)
            /bin/bash script/install/debian.sh
            ;;
    esac
fi

# Install ruby
rbenv install 2.4.1
rbenv global 2.4.1

# Install python
pyenv install 3.6.2
pyenv global 3.6.2

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install plugins then exit
vim +PlugInstall +qall
