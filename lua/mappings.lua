local map = vim.api.nvim_set_keymap

-- Sudo save with :W
-- This requires ssh-askpass to be installed on the system.
-- Also `export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'` in your shell's rc file.
map('c', 'W', "exe 'w !sudo tee >/dev/null %:p:S' | setl nomod<CR>", {silent = true})

-- Windows: moving between.
map('n', '<C-Up>', '<C-w>k', {noremap = true})
map('n', '<C-Down>', '<C-w>j', {noremap = true})
map('n', '<C-Left>', '<C-w>h', {noremap = true})
map('n', '<C-Right>', '<C-w>l', {noremap = true})

-- Windows: resizing.
map('n', '<C-k>', ':resize +2 <CR>', {noremap = true})
map('n', '<C-j>', ':resize -2 <CR>', {noremap = true})
map('n', '<C-h>', ':vertical resize -2 <CR>', {noremap = true})
map('n', '<C-l>', ':vertical resize +2 <CR>', {noremap = true})

-- Split windows.
map('n', '<C-o>', ':split<CR>', {noremap = true})
map('n', '<C-p>', ':vsplit<CR>', {noremap = true})

-- Buffers: moving between.
map('n', '<leader>]', ':bnext<CR>', {noremap = true})
map('n', '<leader>[', ':bprevious<CR>', {noremap = true})

-- Saving files.
map('n', '<C-s>', ':update<CR>', {noremap = true})
map('i', '<C-s>', '<Esc>:update<CR>', {noremap = true})

-- Toggle line numbers and relative number.
map('n', '<leader>1', ':set number!<CR>', {noremap = true, silent = true})
map('n', '<leader>2', ':set number! relativenumber!<CR>', {noremap = true, silent = true})

-- Toggles invisible characters - tabs, eol and spaces.
map('n', '<leader>i', ':set list!<CR>', {noremap = true, silent = true})

-- Toggles spell checking.
map('n', '<leader>sp', ':setlocal spell! spelllang=en_au<CR>', {noremap = true})

-- Opens pdf documents for viewing.
map('n', '<leader>pdf', ':exe ":silent !mupdf %"<CR>', {noremap = true})

-- Opens various files in the Ocular document viewer.
map('n', '<leader>v', ':exe ":silent !okular %"<CR>', {noremap = true})

-- Opens html documents in default browser.
map('n', '<leader>b', ':exe ":silent !sensible-browser %"<CR>', {noremap = true})

-- Run python progam in split terminal window.
map('n', '<F5>', ':split term://python %<CR>', {noremap = true})
map('n', '<F6>', ':vsplit term://python %<CR>', {noremap = true})
map('n', '<F7>', ':RunPython<CR>', {noremap = true}) -- This will run the code in the commands.lua file.

-- To disable trackpad.
map('n', '<Up>', '<nop>', {noremap = true})
map('n', '<Down>', '<nop>', {noremap = true})
map('n', '<Left>', '<nop>', {noremap = true})
map('n', '<Right>', '<nop>', {noremap = true})

map('i', '<Up>', '<nop>', {noremap = true})
map('i', '<Down>', '<nop>', {noremap = true})
map('i', '<Left>', '<nop>', {noremap = true})
map('i', '<Right>', '<nop>', {noremap = true})

map('v', '<Up>', '<nop>', {noremap = true})
map('v', '<Down>', '<nop>', {noremap = true})
map('v', '<Left>', '<nop>', {noremap = true})
map('v', '<Right>', '<nop>', {noremap = true})
