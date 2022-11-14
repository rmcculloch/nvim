-- So Nvim can interact properly with the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Use to ensure formatting is maintained during paste.
vim.opt.pastetoggle = "<F2>"

-- Set printer.
vim.opt.pdev = "HP-LaserJet-400-colorMFP-M475dn"

-- vim.opt.background = 'dark'

-- This method uses {{{ at the start of the fold and }}} at the end.
vim.opt.foldmethod = "marker"

-- Disable annoying temporary files.
vim.opt.swapfile = false

-- Turn on page title.
vim.opt.title = true

-- Turn on auto change directory.
vim.opt.autochdir = true

-- Turn on page numbers and relative numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Sets the list characters so you can see tabs, eol and spaces when :set list.
vim.opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"

-- Sets the position of the cursor from the top and bottom of the page when scrolling.
-- Set to a high number, e.g. 999, if you want the cursor in the middle of the page.
vim.opt.scrolloff = 999

-- Gets rid off annoying search highlighting.
vim.opt.hlsearch = false

-- Case insensitive searching.
vim.opt.ignorecase = true

-- Ignore ignorecase in certain cases, e.g. when using capitals.
vim.opt.smartcase = true

-- More natural behaviour when splitting windows.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set termgui colors (supported by most terminals).
vim.opt.termguicolors = true

-- Highlights the line where cursor is to make the line you're on more visible.
vim.opt.cursorline = true

-- Sets the text width where the line will break. A value of 0 for unlimited.
vim.opt.textwidth = 79

-- Shows visible marker (vertical line) to indicate maximum text width.
vim.opt.colorcolumn = "79"

-- Prevents words breaking when the line wraps to the next line.
vim.opt.linebreak = true

-- Sets the nvim terminal buffer to max size.
-- Max size seems to be 100020 lines.
vim.cmd([[autocmd TermOpen * setlocal scrollback=-1]])

-- Autoindent
vim.opt.autoindent = true

-- Tabs
-- The number of spaces for each tab.
vim.opt.tabstop = 4
-- The number of spaces for each step of autoindent.
vim.opt.shiftwidth = 4
-- Makes sure that tabs are converted to spaces.
vim.opt.expandtab = true

-- Disable mouse for Vim and terminal.
vim.opt.mouse = ""

-- Adding a directory to the runtime path.
-- vim.opt.runtimepath:append('~/.config/nvim/path/to/directory')

-- formatoptions here tend to be overwritten somewhere else, e.g. plugins.
-- Consider using manually when required or where loaded after everything else.
-- Turn off automatically inserting a comment on a new line.
-- vim.opt.formatoptions = vim.opt.formatoptions - 'cro'
-- Automatically reformats text length when
-- vim.opt.formatoptions = vim.opt.formatoptions + 'a'

-- Setup neovim for virtual environment.
-- vim.cmd[[let g:python3_host_prog = '~/path/to/virtualenv/python']]
-- hello
