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


## Super-X/C/V for Cut/Copy/Paste
I really like the approach of using the Command key for clipboard operations. 
I use the command line very often and I want to continue using Control+C for cancel. 

[This blog](https://www.foell.org/justin/windows-xcv-cut-copy-paste-in-ubuntu/) covers the setup on several different 
applications, but this is a quick sumary.

### Gnome 
 - Settings > Keyboard > Keyboard Shortcuts
 - Type "super" in the search
 - Remove or change to Shift+Super+Letter
 - Tweaks > Keyboard & Mouse > Overview Shortcut > Set "right super" (use Shift-Super-S for the overview)

### GTK 
 - GTK keybindings will cover many applications. Edit `~/.config/gtk-3.0/gtk.css`
 ```
 @binding-set gtk-super-cut-copy-paste
{
        bind "<Super>x" { "cut-clipboard" () };
        bind "<Super>c" { "copy-clipboard" () };
        bind "<Super>v" { "paste-clipboard" () };
        bind "<Super>a" { "select-all" (1) };
        bind "<Super>z" { "undo" () };
}

* {
        -gtk-key-bindings: gtk-super-cut-copy-paste
} 
 ```
 ### Gnome Terminal
 - Open the terminal
 - Edit > Preferences > Shortcuts
 - Set Copy, Paste and Select All with the super key

 ### VSCode
 Edit user `keybindings.json` file and add this keybindings as additions.

>vi ~/.config/Code/User/keybindings.json

Super-X/C/V is already working from the GTK settings, so we just need to add the following to get Super-A/Z for Select-All/Undo/Redo:
```
// Place your key bindings in this file to overwrite the defaults
[
    {
        "key": "meta+a",
        "command": "editor.action.selectAll", "when": "textInputFocus"
    },
    {
        "key": "meta+z",
        "command": "undo", "when": "textInputFocus && !editorReadOnly"
    },
    {
        "key": "shift+meta+z",
        "command": "redo", "when": "textInputFocus && !editorReadOnly"
    }
]
```

