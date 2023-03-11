#!/bin/bash

validate_result() {
    if [ $? -0 ne ]; then
        echo "An error ocurred. Process cancelled"
        exit -1
    fi
}

print_separator() {
    echo "-----------------------------------------------------"
}

confirm() {
    local prompt default reply

    if [ "${2:-}" = "Y" ]; then
        prompt="Y/n"
        default=Y
    elif [ "${2:-}" = "N" ]; then
        prompt="y/N"
        default=N
    else
        prompt="y/n"
        default=
    fi

    while true; do
        echo -n "$1 [$prompt] "
        read reply </dev/tty

        if [ -z "$reply" ]; then
            reply=$default
        fi

        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

# Script for configuring Elementary
echo "This script is for configuring a recently installed Elementary!"
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating system..."
apt update
apt upgrade -y
validate_result
print_separator

echo "*** Installing Basic Tools..."

# Fixing "add-apt-repository" not found error
apt install software-properties-common -y
# Enable .deb double click instalation
apt install gdebi -y
print_separator

## Use Snaps packages (https://snapcraft.io/store)
echo "*** Installing Snap packages support..."
apt install snapd -y
snap refresh
print_separator

# Tweaks / Visual modifications
echo "*** Installing elementary-tweaks..."
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt update
apt install elementary-tweaks -y
print_separator

# Clipped (Clipboard Manager)
echo "*** Installing Clipped clipboard manager..."
sudo apt install com.github.davidmhewitt.clipped -y
print_separator

# Flatpak App installer (https://flatpak.org/setup/)
#echo "(Remember you already has installed Snap packages) "
#read -p "Do you want to install 'Flatpak' app manager (Y/N)? " -n 1 -r
if confirm "Do you want to install 'Flatpak' app manager (You you already have installed Snap packages)" "N";
then
    echo "*** Installing Flatpak..."
    add-apt-repository -y ppa:alexlarsson/flatpak
    apt update
    apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi
print_separator

# System Monitor
if confirm "Do you want to install Stacer-System-Monitor? " "Y";
then
  # Stacer : https://github.com/oguzhaninan/Stacer
  echo "*** Installing Stacer-System-Monitor..."
  add-apt-repository -y ppa:oguzhaninan/stacer
  apt update
  apt-get install stacer -y
else
    if confirm "Do you want to install Gnome-System-Monitor? " "Y";
    then
      echo "*** Installing Gnome-System-Monitor..."
      apt install gnome-system-monitor -y
    fi
fi
print_separator

# Improve Laptop battery life
if confirm "Do you want to optimize your battery life [for laptops]? " "N";
then
  apt install tlp tlp-rdw -y
fi
print_separator

# Timeshift : https://www.youtube.com/watch?v=ShW7NcmhqAE
if confirm "Do you want to install 'Timeshift' backups system? " "N";
then
  apt-add-repository -y ppa:teejee2008/ppa
  apt-get update
  apt-get install timeshift -y
fi
print_separator

# Enable tray icons for third-party apps
# https://averagelinuxuser.com/after-install-elementary-juno/#14-enable-tray-icons-for-third-party-apps

echo "Cleaning...."
apt autoremove -y

echo "###### NOTES ######"
echo "  >>> Clipped default paste shortcut is (Ctrl+Alt+V)"
echo "  >>> Openning website for installing 'Snaptastic' from the AppCenter"
epiphany "https://appcenter.elementary.io/com.github.bartzaalberg.snaptastic/" &
