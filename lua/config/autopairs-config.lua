-- This part of the config taken from https://github.com/Allaman/nvim.
enable_check_bracket_line = false
local status_ok = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end
local npairs = require "nvim-autopairs"

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = {"string"}, -- it will not add pair on that treesitter node
        javascript = {"template_string"},
        java = false -- don't check treesitter on java
    }
}

-- This part of the config taken from the nvim-autopairs Github page for fast wrap.

-- put this to setup function and press <a-e> to use fast_wrap
npairs.setup({
    fast_wrap = {},
})

-- change default fast_wrap
npairs.setup({
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = 0, -- Offset from pattern match
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})
