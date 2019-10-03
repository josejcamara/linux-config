#!/bin/bash


# Script for configuring Elementary
echo Welcome to Elementary! Configuring...
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating system..."
apt update
apt upgrade

# Fixing "add-apt-repository" not found error
apt install software-properties-common -y

# Enable .deb double click instalation
echo "Installing gdebi..."
apt install gdebi -y

## Use Snaps packages (https://snapcraft.io/store)
echo "Installing Snap packages support..."
sudo apt install snapd -y
snap refresh
echo " ... Please install 'Snaptastic' from the AppCenter"
epiphany "https://appcenter.elementary.io/com.github.bartzaalberg.snaptastic/"

# Tweaks / Visual modifications
echo "Installing elementary-tweaks..."
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo apt update
sudo apt install elementary-tweaks -y

# Clipped (Clipboard Manager)
echo "Installing Clipped clipboard manager..."
sudo apt install com.github.davidmhewitt.clipped -y
echo "  >>> Default paste shortcut is (Ctrl+Alt+V)"

# Flatpak App installer (https://flatpak.org/setup/)
read -p "Do you want to install 'Flatpak' app manager? " -n 1 -r
echo "(Remember you already has installed Snap packages) "
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing Flatpak..."
    add-apt-repository ppa:alexlarsson/flatpak
    apt update
    apt install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# System Monitor
read -p "Do you want to install the standard Gnome-System-Monitor (G) or Stacer-System-Monitor (S)? " -n 1 -r
echo "(Remember you already has installed Snap packages) "
if [[ $REPLY =~ ^[Ss]$ ]]
then
  # Stacer : https://github.com/oguzhaninan/Stacer
  echo "Installing Stacer-System-Monitor..."
  add-apt-repository ppa:oguzhaninan/stacer -y
  apt update
  apt-get install stacer -y
else
  echo "Installing Gnome-System-Monitor..."
  apt install gnome-system-monitor
fi

# Improve Laptop battery life
read -p "Are you using a laptop? Do you want to optimize your battery life? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  apt install tlp tlp-rdw
fi

# Timeshift : https://www.youtube.com/watch?v=ShW7NcmhqAE
read -p "Do you want to install 'Timeshift' backups system? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing Timeshift..."
  apt-add-repository -y ppa:teejee2008/ppa
  apt-get update
  apt-get install timeshift
fi

# Enable tray icons for third-party apps
# https://averagelinuxuser.com/after-install-elementary-juno/#14-enable-tray-icons-for-third-party-apps
