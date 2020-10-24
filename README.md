# Nvim Config Files

## Download Config Files

`cd ~/.config`  
`git clone https://github.com/rmcculloch/nvim`

## Install VimPlug

Visit https://github.com/junegunn/vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
## Install Neovim Python Package

`pip install neovim`

## Install Nodejs

I prefer to use nvm to install node so install that first - see https://github.com/nvm-sh/nvm  

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash`  
`nvm install node` - this will install the latest version.  

Note you may find a conflict with coc.nvim (Conquer of Completion) and the
latest version of node installed by nvm.  If so, just install the version of
node that coc.nvim wants to use, e.g. `nvm install 12.11.1`

## Install Neovim Package

`npm install -g neovim`

## Install Plugins

Open nvim and run `:PlugInstall`

## Troubleshooting

If you run into errors, it may be useful to run `:checkhealth` to find the problem.

## Working with COC (Conquer of Completion) in Nvim

Coc is a completion engine for Vim, ported from VSCode. It has support for many
different languages, linters, snippets, etc. Documentation is at their GitHub
page. Each extension has its own documentation. These extensions can be
installed within Nvim via `:CocInstall <extension name>` For example
`:CocInstall coc-python coc-tsserver coc-marketplace coc-html coc-css
coc-snippets`.  You can see what extensions are available and installed with
`:CocList marketplace` 

You can run `:CocCommand <Tab>` which will give you a list of available
commands.  This is context dependent, meaning different options appear
depending on what file you have open, e.g. a .py file. Critical to IDEs are
intellisense completion and linting. To get this to work properly for your
language/s, you have to understand the environment you are working in. For
example, for python programming, I use pyenv to manage the versions of python I
use in Linux. I also use pipenv to setup and work from virtual environments
when I'm programming in python. Critical to getting everything working is
selecting the right python interpreter. You can either set the interpreter in
Nvim's coc-settings.json file or maybe a better option is to set the
interpreter in Nvim by typing `:CocCommand <tab>` and then selecting
`python.setInterpreter`. It will tell you what current python interpreter is
being used and provide a list of other options.  It will be obvious from the
path what interpreter belongs to a virtual environment, pyenv or other. If you
are working in a virtual environment but select another interpreter, the
completion engine (e.g. jedi) will only have access to the libraries in that
other environment so you may notice completion problems. You will also have to
have jedi installed in the environment associated with the interpreter. This
means a lot of problems can be solved by selecting the right interpreter.
Similarly you can set your linter of choice by typing `:CocCommand <tab>` and
then selecting `python.setLinter`. It will tell you the current linter being
used and provide a list of other options. You need to make sure the linter is
installed in the environment associated with the interpreter you've selected.
It also gives you the option to install the linter you choose if it isn't
already installed. Just make sure you're working with the right interpreter in
the right environment. Or can install the linter via `pip install <package>` or
`pipenv install <package>`
