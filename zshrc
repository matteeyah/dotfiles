### Antigen ###
source ~/.dotfiles/vendor/antigen/bin/antigen.zsh
# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting
# Completions bundle
antigen bundle zsh-users/zsh-completions
# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
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
export PATH="$HOME/.rbenv/shims:${PATH}"
command rbenv rehash 2>/dev/null
### Ruby ###

### fzf ###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### fzf ###
