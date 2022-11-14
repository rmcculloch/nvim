require("telescope").setup({

    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- path_display = {'smart'},
        wrap_results = true,
        scroll_strategy = "limit",
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure

        -- Below are default settings for fzf. Uncomment if wish to make changes.
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
        -- fzf = {
        --     -- Default settings.
        --       fuzzy = true,                    -- false will only do exact matching
        --       override_generic_sorter = true,  -- override the generic sorter
        --       override_file_sorter = true,     -- override the file sorter
        --       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        --                                        -- the default case_mode is "smart_case"
        -- },
        file_browser = {
            theme = "ivy",
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
})

-- load_extension, somewhere after setup function:
require("telescope").load_extension("media_files")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

-- Telescope non-default key maps.
local map = vim.api.nvim_set_keymap
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>mf", ":Telescope media_files<CR>", { noremap = true })

-- Mapping for custom telescope functions.

-- Can use this if vim.keymap.set approach fails.
-- vim.cmd [[nnoremap <leader>fn <cmd>lua require('config.telescope-config').find_notes()<cr>]]

vim.keymap.set("n", "<leader>gn", function()
    return require("config.telescope-config").grep_notes()
end, { noremap = true })

vim.keymap.set("n", "<leader>fn", function()
    return require("config.telescope-config").find_notes()
end, { noremap = true })

vim.keymap.set("n", "<leader>gp", function()
    return require("config.telescope-config").grep_projects()
end, { noremap = true })

vim.keymap.set("n", "<leader>gv", function()
    return require("config.telescope-config").grep_vim_files()
end, { noremap = true })

vim.keymap.set("n", "<leader>fp", function()
    return require("config.telescope-config").find_projects()
end, { noremap = true })

vim.keymap.set("n", "<leader>fv", function()
    return require("config.telescope-config").find_vim_files()
end, { noremap = true })

-- Custom telescope functions.

local M = {} -- Table variable. In lua M is used to represent Module.

-- This is one way to do it. The other way is shown below.
-- function M.grep_notes()
--   local opts = {}
--   opts.search_dirs = {'~/Documents/Documentation/Notes'}
--   opts.prompt_prefix = ' > '
--   opts.prompt_title = 'Grep Notes'
--   opts.shorten_path = true
--   require'telescope.builtin'.live_grep(opts)
-- end

function M.grep_notes()
    require("telescope.builtin").live_grep({
        search_dirs = { "~/Documents/Documentation/Notes" },
        prompt_prefix = " > ",
        prompt_title = "Grep Notes",
        shorten_path = true,
    })
end

function M.find_notes()
    require("telescope.builtin").find_files({
        cwd = "~/Documents/Documentation/Notes",
        shorten_path = true,
    })
end

function M.grep_projects()
    require("telescope.builtin").live_grep({
        search_dirs = { "~/Projects" },
        prompt_prefix = " > ",
        prompt_title = "Grep Notes",
        shorten_path = true,
    })
end

function M.grep_vim_files()
    require("telescope.builtin").live_grep({
        search_dirs = { "~/.config/nvim" },
        prompt_prefix = " > ",
        prompt_title = "Grep Vim Files",
        shorten_path = true,
    })
end

function M.find_projects()
    require("telescope.builtin").find_files({
        cwd = "~/Projects",
        shorten_path = true,
    })
end

function M.find_vim_files()
    require("telescope.builtin").find_files({
        cwd = "~/.config/nvim/",
        shorten_path = true,
    })
end

return M
