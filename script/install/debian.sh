# Update package list
sudo apt update
# Use the noninteractive frontend
export DEBIAN_FRONTEND="noninteractive"

sudo apt -y install tig
sudo apt -y install zsh
sudo apt -y install rbenv
sudo apt -y install pyenv
# Install the ruby-build plugin for rbenv 
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt -y install curl
sudo apt -y install vim-nox

# Install ruby dependencies
sudo apt -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

# Install YouCompleteMe dependencies
sudo apt -y install cmake build-essential
sudo apt -y install python-dev python3-dev
