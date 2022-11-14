local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Sudo save with :W
-- This requires ssh-askpass to be installed on the system.
-- Also `export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'` in your shell's rc file.
map("c", "W", "exe 'w !sudo tee >/dev/null %:p:S' | setl nomod<CR>", { silent = true })

-- Windows: moving between.
map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)
-- Windows: resizing.

map("n", "<C-k>", ":resize +2 <CR>", opts)
map("n", "<C-j>", ":resize -2 <CR>", opts)
map("n", "<C-h>", ":vertical resize -2 <CR>", opts)
map("n", "<C-l>", ":vertical resize +2 <CR>", opts)

-- Move text up and down.
-- note: A is the Alt key.
-- visual mode:
map("v", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- Split windows.
map("n", "<C-o>", ":split<CR>", opts)
map("n", "<C-p>", ":vsplit<CR>", opts)

-- Buffers: moving between.
map("n", "<leader>]", ":bnext<CR>", opts)
map("n", "<leader>[", ":bprevious<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Saving files.
map("n", "<C-s>", ":update<CR>", opts)
map("i", "<C-s>", "<Esc>:update<CR>", opts)

-- Toggle line numbers and relative number.
map("n", "<leader>1", ":set number!<CR>", opts)
map("n", "<leader>2", ":set number! relativenumber!<CR>", opts)

-- Toggles invisible characters - tabs, eol and spaces.
map("n", "<leader>i", ":set list!<CR>", opts)

-- Toggles spell checking.
map("n", "<leader>sp", ":setlocal spell! spelllang=en_au<CR>", opts)

-- Opens pdf documents for viewing.
map("n", "<leader>pdf", ':exe ":silent !mupdf %"<CR>', opts)

-- Opens various files in the Ocular document viewer.
map("n", "<leader>v", ':exe ":silent !okular %"<CR>', opts)

-- Opens html documents in default browser.
map("n", "<leader>b", ':exe ":silent !sensible-browser %"<CR>', opts)

-- Run python progam in split terminal window.
map("n", "<F5>", ":split term://python %<CR>", opts)
map("n", "<F6>", ":vsplit term://python %<CR>", opts)
map("n", "<F7>", ":RunPython<CR>", opts) -- This will run the code in the commands.lua file.

-- Formatting with Null-LS. "fc" short for format code.
map("n", "<leader>fc", ":lua vim.lsp.buf.format { async = true }<CR>", opts)

-- To disable trackpad.
map("n", "<Up>", "<nop>", opts)
map("n", "<Down>", "<nop>", opts)
map("n", "<Left>", "<nop>", opts)
map("n", "<Right>", "<nop>", opts)

map("i", "<Up>", "<nop>", opts)
map("i", "<Down>", "<nop>", opts)
map("i", "<Left>", "<nop>", opts)
map("i", "<Right>", "<nop>", opts)

map("v", "<Up>", "<nop>", opts)
map("v", "<Down>", "<nop>", opts)
map("v", "<Left>", "<nop>", opts)
map("v", "<Right>", "<nop>", opts)
