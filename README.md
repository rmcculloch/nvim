# Nvim Config Files

## Download Config Files
`cd ~/.config`  
`git clone https://github.com/rmcculloch/nvim`

## Install VimPlug
Visit https://github.com/junegunn/vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install Neovim Python Package
`pip3 install --user neovim`

## Install Nodejs
I prefer to use nvm to install node so install that first - see https://github.com/nvm-sh/nvm  
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash`  
`nvm install node` - this will install the latest version.  
Note you may find a conflict with coc.nvim (Conquer of Completion) and the latest
version of node installed by nvm.  
If so, just install the version of node that coc.nvim wants to use, e.g. `nvm install 12.11.1`

## Install Plugins
Open nvim and run `:PlugInstall`

## Troubleshooting
If you run into errors, it may be useful to run `:checkhealth` to find the problem.
