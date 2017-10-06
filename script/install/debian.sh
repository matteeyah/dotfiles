# Update package list
sudo apt update
# Use the noninteractive frontend
export DEBIAN_FRONTEND="noninteractive"

sudo apt -y install zsh
sudo apt -y install git
sudo apt -y install tig
sudo apt -y install rbenv
# Install the ruby-build plugin for rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt -y install pyenv
# Install the pyenv-virtualenvwrapper plugin for pyenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
sudo apt -y install tmux
sudo apt -y install vim

sudo apt -y install curl

# Install ruby dependencies
sudo apt -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

# Install python dependencies
sudo apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
