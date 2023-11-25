# NeoVim editor

Followed guide from:
- https://youtu.be/Mtgo-nP_r8Y?si=SWTCKb2xhR1w_aVO

## Install tools

### Install neovim

<!-- sudo apt install neovim  >> install OLD VERSION !!  -->
> wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz  

> alias nvim=\$HOME/nvim/bin/nvim  
> echo 'nvim=\$HOME/nvim/bin/nvim' >> .zshrc

> sudo apt-get install python3-neovim  
> sudo apt-get install build-essential 

### Install Nerd Font
```
mkdir ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

unzip JetBrainsMono.zip

Restart your terminal and go to preferences. Change the font to use in your profile

```



> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

### Install NV Chad

NVChad is a neovim configuration

> git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

### Run NeoVim First Time

Open `nvim` and answer NOT to install the example custom config.

Change the theme. Type `Space + t + h` and choose "catppuccin"

Install **syntax highlighting**. Enter the command mode and type `TSInstall <language>`.  
Check your installed syntaxes with `TSInstallInfo`. These are the suggested.
- bash
- dockerfile
- json
- python
- sql
- terraform
- yaml


Enable the **file navigator** with "Ctrl + n" 
- Navigate with the arrows
- Click Enter to open a file
- Press "m" to mark a file to allow you to easily find it later
- Create files pressing the "a" key and typing the filename
- Copy files using the "c" and "p" keys
- Rename files using the "r" key
- Search files using Space > f > f
- Search only in your open file using Space > f > b (search in buffer)
- Use Space > c > h for getting help or the rest of commands

**Windows Navigation**  
- :sp = Split (Horizontal)
- :vsp = Vertical split
- :x = Close the active panel
- Ctrl + h/j/k/l to navigate between panel (left/down/up/right)
- Use the Tab key to move forward or Shift+Tab to move backward the tab-buffer
- Use Space > x to close the active tab

**Terminal Panel**
- Space > h for showing an horizontal window
- Space > v for showing a vertical window