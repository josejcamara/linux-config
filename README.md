# Tweaks for Linux

## Clipboard History
Use [this gnome extension](https://extensions.gnome.org/extension/4839/clipboard-history/) for having simple clipboard history.  


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
 - GTK keybindings will cover many applications
 - Edit `~/.config/gtk-3.0/gtk.css`
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

