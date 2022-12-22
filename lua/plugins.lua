return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- *** GENERAL ***

    use({ "tpope/vim-surround" })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs-config")
        end,
    })

    -- Might want to swap out for lifepillar/gruvbox8 as faster startup time.
    use({
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("config.gruvbox-config")
        end,
    })

    use({
        "terrortylor/nvim-comment",
        config = function()
            require("config.comment-config")
        end,
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("config.tree-config")
        end,
    })

    -- Enabling lualine plugin can break the Vim welcome page (i.e. it doesn't display)
    -- Happens only when config file is enabled to override options.
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        -- config = function() require'config.lualine-config' end,
    })

    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.bufferline-config")
        end,
    })

    use({
        "cappyzawa/trim.nvim",
        config = function()
            require("config.trim-config")
        end,
    })

    use({
        "CRAG666/code_runner.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("config.coderunner-config")
        end,
    })

    -- Install texlive-full on system for complete functionality.
    use({
        "lervag/vimtex",
        config = function()
            require("config.vimtex-config")
        end,
    })

    -- *** CMP ***

    use({ "onsails/lspkind-nvim" })

    use({ "hrsh7th/cmp-nvim-lsp" })

    use({ "hrsh7th/cmp-nvim-lua" })

    use({ "octaltree/cmp-look" })

    use({ "hrsh7th/cmp-path" })

    use({ "hrsh7th/cmp-buffer" })

    -- use {'hrsh7th/cmp-cmdline'}

    use({ "saadparwaiz1/cmp_luasnip" })

    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp-config")
        end,
    })

    --*** LUASNIP ***

    use({
        "L3MON4D3/LuaSnip",
        -- tag = 'v<CurrentMajor>.*',
        config = function()
            require("config.luasnip-config")
        end,
    })

    -- add vscode snippets here
    use({ "rafamadriz/friendly-snippets" })
    use({ "ylcnfrht/vscode-python-snippet-pack" })

    -- *** LSP ***

    use({ "williamboman/nvim-lsp-installer" })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lspconfig-config")
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.null-ls-config")
        end,
    })

    -- *** TELESCOPE ***

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("config.telescope-config")
        end,
    })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({
        "nvim-telescope/telescope-media-files.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" } },
    })

    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- *** TREESITTER ***

    use({
        "nvim-treesitter/nvim-treesitter",
        -- run = ':TSUpdate',
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("config.treesitter-config")
        end,
    })
    use({ "tpope/vim-fugitive" })
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
      config = function()
          require("config.gitsigns-config")
      end,
    }
end)
