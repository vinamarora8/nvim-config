return {
    -- the colorscheme should be available when starting Neovim
    {
        "tanvirtin/monokai.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            local monokai = require("monokai")
            local palette = monokai.pro

            local custom_hlgroups = {
                Normal = { bg = palette.base1 },
                SignColumn = { bg = palette.base0 },
                LineNr = { fg = palette.base5, bg = palette.base0 },
                CursorLine = { bg = palette.base2 },
                CursorLineNr = { fg = palette.base5, bg = palette.base2 },
                -- MatchParen = { fg = palette.green },
                CopilotSuggestion = { fg = palette.base4 },
                TabLineSel = { fg = palette.base0, bg = palette.base6 },
                TabLine = { fg = palette.base7, bg = palette.base3 },
                TabLineFill = {},
                IblIndent = { fg = palette.base5 },
            }

            monokai.setup({
                italics = false,
                custom_hlgroups = custom_hlgroups,
            })
        end,
    },
}
