-- Will load snippets from the friendly-snippets plugin and any other vscode snippets in
-- the runtimepath.
require("luasnip.loaders.from_vscode").load()

-- load snippets from ~/.config/nvim/vscode-python-snippet-pack
-- vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/vscode-python-snippet-pack,'
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/vscode-python-snippet-pack" } })

-- Luasnip config in cmp-config.lua
