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

main() {
  if ! command -v brew; then
    echo "Please install brew first."
    exit 1
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
  brew install ${required} # word splitting is intended here

  echo "Do you want to install the optional packages as well?"
  select yn in "Yes" "No"; do
    # shellcheck disable=SC2086
    case $yn in
      "Yes") brew install ${optional}; break;;
      "No") exit 0;;
      *) echo "Invalid option";;
    esac
  done

  exit 0
}

main "$@"
