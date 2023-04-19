### Locales ###
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
### Locales ###

### Brew ###
if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
### Brew ###

### zinit ###
if command -v brew >/dev/null; then
  ZINIT_HOME="$(brew --prefix zinit)"
else
  ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
fi

source "${ZINIT_HOME}/zinit.zsh"
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
if command -v brew >/dev/null; then
  ASDF_HOME="$(brew --prefix asdf)/libexec"
else
  ASDF_HOME="${HOME}/.asdf"
fi

source "${ASDF_HOME}/asdf.sh"
### asdf ###

### SSH ###
eval "$(ssh-agent)"
### SSH ###

### PostgreSQL@15 ###
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
### PostgreSQL@15 ###
