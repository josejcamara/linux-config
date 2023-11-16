# NeoVim editor

## Install tools

### Install neovim

<!-- > sudo apt install neovim  OLD VERSION  -->
> wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz  

> alias nvim=\$HOME/nvim/bin/nvim  
> echo 'nvim=\$HOME/nvim/bin/nvim' >> .zshrc

> sudo apt-get install python3-neovim  

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

Open `nvim` and answer NOT to install the example custom config.

Change the theme. Type `Space + t + h` and choose "catppuccin"

Ctrl + n >> show navigator