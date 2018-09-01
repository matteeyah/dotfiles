#!/bin/bash

function join_lines {
  echo "$1" | paste -sd ' ' -
}

main() {
  if ! command -v brew; then
    echo "Please install brew first."
    exit 1
  fi

  packages=$(awk '/## Packages/,EOF { print $0 }' "README.md")
  re='/\* (\w|[-\w]+) - (?:.*) - (?:.*)/g'

  required=$(echo "${packages}" | awk '/### Required/,/### Optional/ { print }')
  required=$(echo "${required}" | awk '/#### brew/,/#### cask/ { print }')
  required=$(echo "${required}" | perl -ln -e"${re} && print \$1")
  required=$(join_lines "${required}")

  optional=$(echo "${packages}" | awk '/### Optional/,EOF { print }')
  optional=$(echo "${optional}" | awk '/#### brew/,/#### cask/ { print }')
  optional=$(echo "${optional}" | perl -ln -e"${re} && print \$1")
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
