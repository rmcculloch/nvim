require("luasnip.loaders.from_vscode").load()

-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").load({ paths = { "my-snippets" } })

require("luasnip.loaders.from_snipmate").load()

-- Luasnip config in cmp-config.lua
