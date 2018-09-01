autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' formats '%S (%b) %u%c'

# %F{color} (%f) - sets (unsets) the color
# %S - path relative to root of vcs
# %b - branch name
# %u - unstaged
# %c - changes

precmd () {
  vcs_info

  # %? - return code of last command
  # %j - number of jobs
  # %(?..) - ternary operator

  local code="%(?.%F{green}.%F{red})?%?%f"
  local jobs="%(1j.%F{red}.)%%%j%f"

  RPROMPT="${code} | ${jobs}"
  if [ -n "${vcs_info_msg_0_}" ]; then
    RPROMPT="${RPROMPT} | ${vcs_info_msg_0_}"
  fi
  if [ -n "${VIRTUAL_ENV}" ]; then
    RPROMPT="${RPROMPT} | $(basename "${VIRTUAL_ENV}")"
  fi

  PROMPT="%F{blue}%~%f "

  export PROMPT
  export RPROMPT
}

