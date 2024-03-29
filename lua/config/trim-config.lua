-- -- default config
-- local config = {
--   disable = {},
--   patterns = {
--     [[%s/\s\+$//e]],
--     [[%s/\($\n\s*\)\+\%$//]],
--     [[%s/\%^\n\+//]],
--     [[%s/\(\n\n\)\n\+/\1/]],
--   },
-- }

require("trim").setup({
    -- if you want to ignore markdown file.
    -- you can specify filetypes.
    ft_blocklist = { "markdown", "python" },

    -- if you want to ignore space of top
    patterns = {
        [[%s/\s\+$//e]],
        [[%s/\($\n\s*\)\+\%$//]],
        [[%s/\(\n\n\)\n\+/\1/]],
    },
})
