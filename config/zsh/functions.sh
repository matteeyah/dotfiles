explain () {
  if [ "$#" -eq 0 ]; then
    printf "Command: "
    while read -r cmd; do
      curl -Gs "https://www.mankier.com/api/v2/explain/?cols=$(tput cols)" --data-urlencode "q=${cmd}"
      printf "Command: "
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs "https://www.mankier.com/api/v2/explain/?cols=$(tput cols)" --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}
