### Locales ###
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
### Locales ###

### Brew ###
eval "$(/opt/homebrew/bin/brew shellenv)"
### Brew ###

### zinit ###
source "$(brew --prefix zinit)/zinit.zsh"
source /opt/homebrew/opt/zinit/zinit.zsh
# Syntax highlighting bundle
zinit light zdharma-continuum/fast-syntax-highlighting
# # Completions bundle
zinit light zsh-users/zsh-completions
# # Better Ctrl+R search
zinit light zdharma-continuum/history-search-multi-word
### zinit ###

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

### asdf ###
if command -v asdf; then
  source "$(brew --prefix asdf)/asdf.sh"
fi
### asdf ###

### Ruby ###
# Set up rbenv if installed
if command -v rbenv; then
  eval "$(rbenv init - zsh)"
fi
### Ruby ###

### Python ###
# Set up pyenv if installed
if command -v pyenv; then
  eval "$(pyenv init - zsh)"
fi
### Python ###

### Node ###
# Set up nodenv if installed
if command -v nodenv; then
  eval "$(nodenv init - zsh)"
fi
### Node ###

### Elixir ###
if command -v exenv; then
  eval "$(exenv init - zsh)"
fi
### Elixir ###

### Java ###
if command -v jenv; then
  eval "$(jenv init - zsh)"
fi
### Java ###

### Go ###
if command -v go; then
  export GOPATH="${HOME}/Projects/go"
  export PATH="${PATH}:${GOPATH}/bin"
fi
### Go ###

### SSH ###
eval "$(ssh-agent)"
### SSH ###
