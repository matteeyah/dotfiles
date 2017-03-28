# Determine which system the script is running on
# Then install system pacakges using the appropriate package manager
if [[ "$OSTYPE" = "darwin"* ]]; then
    /bin/bash script/install/macos.sh
elif [[ "$OSTYPE" = "linux-gnu" ]]; then
    case $(grep ^ID= /etc/os-release | cut -d = -f2) in
        debian|ubuntu)
            /bin/bash script/install/debian.sh
            ;;
    esac 
fi
