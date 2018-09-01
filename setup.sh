#!/bin/bash

function join_lines {
  echo "$1" | paste -sd ' ' -
}

function find_between {
  echo "$1" | awk "$2,$3 { print }"
}

function perl_re {
  echo "$1" | perl -ln -e"${2}"
}

function packages {
  echo "Installing packages"

  if ! command -v brew; then
    echo "Please install brew first."
    return 1
  fi

  packages=$(awk '/## Packages/,EOF { print $0 }' "README.md")
  re='/\* (\w|[-\w]+) - (?:.*) - (?:.*)/g'

  required=$(find_between "${packages}" "/### Required/" "/### Optional/")
  required=$(find_between "${required}" "/#### brew/" "/#### cask/")
  required=$(perl_re "${required}" "${re} && print \$1")
  required=$(join_lines "${required}")

  optional=$(find_between "${packages}" "/### Optional/" "EOF")
  optional=$(find_between "${optional}" "/#### brew/" "/#### cask/")
  optional=$(perl_re "${optional}" "${re} && print \$1")
  optional=$(join_lines "${optional}")

  echo "Installing required packages"
  # shellcheck disable=SC2086
  if [ "$1" = true ]; then
    brew install ${required}

    echo "Do you want to install the optional packages as well?"
    select yn in "Yes" "No"; do
      # shellcheck disable=SC2086
      case "${yn}" in
        "Yes") brew install ${optional}; break;;
        "No") return 0;;
        *) echo "Invalid option";;
      esac
    done
  else
    brew uninstall ${required}
    brew uninstall ${optional}
  fi

  return 0
}

function symlinks {
  echo "Installing symlinks"

  re='/\* (\w+)/g'
  symlinks=$(awk '/### Available Configurations/,/## Packages/ { print }' "README.md")
  symlinks=$(perl_re "${symlinks}" "${re} && print \$1")
  symlinks=$(join_lines "${symlinks}")
  # shellcheck disable=SC2086
  if [ "$1" = true ]; then
    stow --restow ${symlinks}
  else
    stow --delete ${symlinks}
  fi

  return 0
}

function main {
  echo "Do you want to install or uninstall the setup?"
  select iu in "Install" "Uninstall"; do
    case "${iu}" in
      "Install")
        packages true
        symlinks true
        break;;
      "Uninstall")
        packages false
        symlinks false
        break;;
      *)
        exit 0
    esac
  done

  exit 0
}

main "$@"
