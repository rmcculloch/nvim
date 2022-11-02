require("luasnip.loaders.from_vscode").lazy_load()

-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "my-snippets" } })

require("luasnip.loaders.from_snipmate").lazy_load()

-- Luasnip config in cmp-config.lua
