### Antigen ###
source /usr/local/share/antigen/antigen.zsh
# Syntax highlighting bundle
antigen bundle zdharma/fast-syntax-highlighting
# Completions bundle
antigen bundle zsh-users/zsh-completions
# Tell Antigen that you're done.
antigen apply
### Antigen ###

### zsh core ###
autoload -U edit-command-line compinit

# completion configuration
compinit
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select=1

# edit-command-line bindings
zle -N edit-command-line
bindkey -e
bindkey '^x^e' edit-command-line
### zsh core ###

### Theme ###
source ~/.dotfiles/config/zsh/clean.zsh-theme
### Theme ###

### Variables ###
# The current user is the default user
DEFAULT_USER="$(whoami)"
export DEFAULT_USER
# Enable CLI colors
export CLICOLOR=1
# Use vim as the default editor
export EDITOR="vim"
GPG_TTY="$(tty)"
export GPG_TTY
TMUX_SHELL="$(command -v zsh)"
export TMUX_SHELL
### Variables ###

### fzf ###
if command -v fzf; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

  if command -v bat; then
    export FZF_DEFAULT_OPTS="--preview 'bat --color=always --theme=zenburn {}'"
  fi
fi
### fzf ###

### Ruby ###
# Set up rbenv if installed
if command -v rbenv; then
  eval "$(rbenv init -)"
fi
### Ruby ###

### Python ###
# Set up pyenv if installed
if command -v pyenv; then
  eval "$(pyenv init -)"
fi
### Python ###

### Node ###
# Set up nodenv if installed
if command -v nodenv; then
  eval "$(nodenv init -)"
fi
### Node ###

### Go ###
if command -v go; then
  export GOPATH="${HOME}/Projects/go"
  export PATH="${PATH}:${GOPATH}/bin"
fi
### Go ###

### Locales ###
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
### Locales ###

### Brew ###
if command -v brew; then
  alias brew_auto="brew update && brew upgrade && brew upgrade --cask && brew cleanup"
fi
### Brew ###
