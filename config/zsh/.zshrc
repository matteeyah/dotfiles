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
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
# Syntax highlighting bundle
zinit light zdharma-continuum/fast-syntax-highlighting
# Completions bundle
zinit light zsh-users/zsh-completions
# Better Ctrl+R search
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

### ObjC Config ###
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
### ObjC Config ###

### SSH ###
eval "$(ssh-agent)"
### SSH ###

### PostgreSQL@17 ###
if command -v brew >/dev/null && brew info postgresql@17 >/dev/null; then
  export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
fi
### PostgreSQL@17 ###

### asdf ###
if [ -d "${HOME}/.asdf" ]; then
  source "${HOME}/.asdf/asdf.sh"
fi
### asdf ###

### pnpm ###
export PNPM_HOME="/Users/matteeyah/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
### pnpm ###

### fzf ###
source <(fzf --zsh)
if command -v fzf >/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  if command -v bat >/dev/null; then
    export FZF_DEFAULT_OPTS="--preview 'bat --color=always --theme=zenburn {}'"
  fi
fi
### fzf ###

### TicketSolve ###
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export TSPATH="/Users/matteeyah/Projects/ticketsolve"
export PATH="$(brew --prefix gnu-getopt)/bin:$PATH"
export PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$TSPATH/extra/admin_scripts:$PATH"
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
export TS_ENABLE_RUBY_DEBUG="true"
export DUMP_VANILLA="true"
### TicketSolve ###
