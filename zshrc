### Antigen ###
source ~/.dotfiles/vendor/antigen/bin/antigen.zsh
# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting
# Completions bundle
antigen bundle zsh-users/zsh-completions
# Load the theme.
POWERLEVEL9K_INSTALLATION_PATH=$HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-bhilburn-SLASH-powerlevel9k.git antigen theme bhilburn/powerlevel9k powerlevel9k 
# Tell Antigen that you're done.
antigen apply
### Antigen ###

### Variables ###
# The current user is the default user
export DEFAULT_USER=`whoami`
# Enable CLI colors
case $OSTYPE in
  "darwin"*)
    export CLICOLOR=1
    ;;
  "linux-gnu")
    alias ls='ls --color=auto'
    ;;
esac
# Use vim as the default editor
export EDITOR=vim
### Variables ###

### Ruby ###
# Set up rbenv
export PATH="/Users/cmattrex/.rbenv/shims:${PATH}"
command rbenv rehash 2>/dev/null
### Ruby ###
