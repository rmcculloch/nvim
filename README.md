# Neovim

## Introduction

Following are the steps required to replicate my existing Neovim setup.
Like many people, I've moved over to almost exclusively using Lua and all the 
benfits this provides to create an excellent IDE for programming/projects.

## Installation

### Install Neovim

Visit [Installing
Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) for
instructions. There are many ways to install Vim, especially on Linux systems.
These instructions relate to Ubuntu 22.04 but will be similar for other
distros. It's important to have a relatively recent version of Neovim for many
of the Lua-based plugins. A good way to do this is to install from source (see
bottom of the 'Installing Neovim' page).

- Install git if not already on your system.
- Download the source code from (https://github.com/neovim/neovim)
- Install build prerequisites.
- Build and install Neovim (best to use method which isolates install in
  $HOME/neovim).
- Add `export PATH="$HOME/neovim/bin:$PATH"` and `alias vim="nvim"` to your
  shell's config file (e.g. .zshrc).
- Source config file or restart terminal.

### Install Prerequisites For This Neovim Config
- nvm (https://github.com/nvm-sh/nvm): provides node and npm.
- `nvm install node`
- `npm install -g neovim`
- pyenv (https://github.com/pyenv/pyenv): provides python and pip.
- `pip install neovim`
- `pip install flake8`
- pyenv-virtualenv (https://github.com/pyenv/pyenv-virtualenv): if require
  python virtual environments (optional).
- `sudo apt update && sudo apt install xsel zathura xdotool rg texlive-full`

### Install Neovim Config Files
- Navigate to $HOME/.config `cd ~/.config`.
- Download Neovim congig files `git clone https://github.com/rmcculloch/nvim`

### Install The Packer Plugin Manager
- Go to (https://github.com/wbthomason/packer.nvim) and follow instructions to
  install Packer (under Quickstart section).
- Start Neovim `vim`
- `:PackerSync` will install the included plugins. These can be viewed in
  ~/.congig/nvim/lua/plugins.lua. Refer to their Github pages for the details.
Note that it may take some time to install the plugin files, especially those
relating to treesitter and the wide range of file types it supports.

### Install Patched Font For Your Terminal
Some of the Neovim plugins require additional icons for the file tree
(nvim-tree) and status line (nvim-lualine) to display properly. The way I've
handled this is to download and install "Sauce Code Pro Nerd Font"
(SourceCodePro) from https://www.nerdfonts.com/font-downloads. Extract the
folder SourceCodePro and place it in ~/.local/share/fonts. Then go to your
terminal and under Preferences then Profiles, select "SauceCode Pro Nerd Font
Mono" as a custom font.

### Checking The Health Of Your Neovim IDE
Neovim has a very handy tool to check the health of your installation.
Run `:checkhealth` from within Neovim and it will provide a detailed list of
your installation, any issues (errors and warnings) and even recommendations
on how to fix these issues.





