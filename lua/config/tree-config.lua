-- Settings translated from vimscript to Lua.

local map = vim.api.nvim_set_keymap
map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
map("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true })
map("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
-- " NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

local set = vim.opt
-- this variable must be enabled for colors to be applied properly
set.termguicolors = true
-- a list of groups can be found at `:help nvim_tree_highlight`

-- vim.cmd takes vimscript for settings you can't translate to Lua.
-- vim.cmd [[
-- highlight NvimTreeFolderIcon guibg=blue
-- ]]

-- Default settings which can be overwritten here. Taken from Github site.

-- init.lua
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    -- auto_close           = false,
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = true, -- default was false
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        -- height = 30, -- note: view.height now obsolete
        hide_root_folder = false,
        side = "left",
        -- auto_resize = false,
        mappings = {
            custom_only = false,
            list = {},
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    actions = {
        change_dir = {
            global = false,
        },
        open_file = {
            quit_on_open = false,
        },
    },
})
