vim.opt.completeopt = "menu,menuone,noselect"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- Shows all completion options.
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "nvim_lua" },
        {
            name = "look",
            keyword_length = 5,
            option = {
                convert_case = true,
                loud = true,
                dict = "/usr/share/dict/words",
            },
        },
        { name = "path" },

        -- All buffers
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },

        -- Visible buffers
        -- {
        --   name = 'buffer',
        --   option = {
        --     get_bufnrs = function()
        --       local bufs = {}
        --       for _, win in ipairs(vim.api.nvim_list_wins()) do
        --         bufs[vim.api.nvim_win_get_buf(win)] = true
        --       end
        --       return vim.tbl_keys(bufs)
        --     end
        --   }
        -- }
    }),

    formatting = {
        -- Youtube: How to set up nice formatting for your sources.
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[nvim-lua]",
                luasnip = "[snip]",
                path = "[path]",
                buffer = "[buf]",
                look = "[dict]",
                -- gh_issues = "[issues]",
                -- tn = "[TabNine]",
            },
        }),
    },
    -- experimental = {
    --   native_menu = false,
    --   ghost_text = true,
    -- },

    view = {
        entries = "custom", -- can be "custom"(default), "wildmenu" or "native"
    },
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--         })
-- })

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--     -- view = {
--     --     entries = {name = 'wildmenu', separator = '|' }
--     -- },
--     sources = {
--     -- { name = 'buffer' }
--     }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
    { name = 'path' }
    }, {
        { name = 'cmdline' }
        })
})
