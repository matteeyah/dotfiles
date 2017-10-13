autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' formats '%b'

precmd () {
  vcs_info

  local git_status
  git_status="$(command git status --porcelain 2> /dev/null | tail -n1)"

  if [ -n "${git_status}" ]; then
    local git_branch="%F{red}${vcs_info_msg_0_}"
  else
    local git_branch="%F{green}${vcs_info_msg_0_}"
  fi

  RPROMPT="${git_branch}"
  if [ -n "${VIRTUAL_ENV}" ]; then
    RPROMPT="$(basename "${VIRTUAL_ENV}")|${RPROMPT}"
  fi

  if [ "${ZSH_CLEAN_PATH_STYLE}" = 1 ]; then
    PROMPT="%F{blue}%c "
  else
    PROMPT="%F{blue}%~ "
  fi

  export PROMPT
  export RPROMPT
}

