# How to add MULTITOUCH trackpad gestures to Linux

A quick guide to setting up libinput-gestures and get some nice multi-touch gestures on your trackpad, on elementary OS (and debian based distributions).

https://www.youtube.com/watch?v=ci6YbQGx3c4

## Commands

sudo gpasswd -a $USER input

sudo apt install xdotool wmctrl libinput-tools

git clone https://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo ./libinput-gestures-setup install

Go back to this repo folder.

Edit the "libinput-gestures.conf" file and review the key maps are the right ones for your linux version

cp ./libinput-gestures.conf ~/.config/libinput-gestures.conf

libinput-gestures-setup restart

    You could get an error like:
    `Failed to open /dev/input/event1 (Permission denied)`
    In that case, restart and try again this last command

## Post steps

- After having everything configured and working, we need to set this script to be run after every restart. Go to your system preferences and set a new on-start script
