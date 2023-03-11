# Overview

If you've been a Mac/OSX user and now moving to Linux, you may miss some of the features or habits it provides.  
You'll find here some tips with the issues/solution I found in my case

# Elementary OS
[Elementary OS](https://elementary.io/) is a Linux distribution based on Ubuntu LTS. It promotes itself as a "thoughtful, capable, and ethical" replacement to macOS.  
Great design, osx like, with it's own pack of Apps.  


# Tweaks
If you don't want to move out of your Linux distribution, take a look to the following tweaks.   First, install Gnome Tweaks:
> sudo apt install gnome-tweaks

## Mission Control
[Mission Control](https://support.apple.com/en-gb/HT204100) offers a bird's-eye view of all your open windows, desktop spaces, full-screen apps, and Split View spaces, making it easy to switch between them.

Ubuntu 22.04/GNOME 3 has a very similar feature "Applications View" enabled by default. To open it, place three fingers and gesture upwards again. 	

## Switch Workspace
This is another feature that comes by default in Ubuntu 22.04. 
Just place three fingers on the touchpad and gesture left or right.

For other systems, you may be interested in [touchegg](https://ubuntuhandbook.org/index.php/2021/06/multi-touch-gestures-ubuntu-20-04/) or this [gnome extension](https://ubuntuhandbook.org/index.php/2022/05/more-multi-touch-gestures-ubuntu-22-04/).

## Pbcopy and Pbpaste
Pbcopy and Pbpaste commands are command line equivalent of copying a file to clipboard, but not available in Linux.  
However, we can replicate the functionality of pbcopy and pbpaste commapbcopy < file.txtnds using Xclip and/or Xsel commands via shell aliasing. Both Xclip and Xsel packages available in the default repositories of most Linux distributions.
> sudo apt install xclip

Edit your ~/.bashrc file *(ZSH users in ~/.zshrc)*:
> alias pbcopy='xclip -selection clipboard'  
> alias pbpaste='xclip -selection clipboard -o'

Then run the following command to update the changes
> source ~/.bashrc

Use it
> pbcopy < file.txt  

