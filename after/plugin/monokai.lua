local function clamp(component)
    return math.min(math.max(component, 0), 255)
end
local function round(num)
    return math.floor(num + 0.5)
end
function ColorScale(col, amt)
    local num = tonumber(string.sub(col, 2), 16)
    local r = round(math.floor(num / 0x10000) * amt)
    local g = round((math.floor(num / 0x100) % 0x100)*amt)
    local b = round((num % 0x100)*amt)
    local ans = string.format("#%x", clamp(r) * 0x10000 + clamp(g) * 0x100 + clamp(b))
    return ans
end

local monokai = require('monokai')
local palette = monokai.classic

local custom = {}
custom.Normal = {
    bg = palette.base0,
}
custom.LineNr = {
    fg = palette.base6,
}
custom.MatchParen = {
    fg = palette.green,
}
custom.CopilotSuggestion = {
    fg = palette.base5,
}
custom.TabLineSel = {
    fg = palette.base0,
    bg = palette.base6,
}
custom.TabLine = {
    fg = palette.base7,
    bg = palette.base3,
}
custom.TabLineFill = {
}
custom.SignColumn = {
      bg = palette.base0,
    }

monokai.setup {
    italics = false,
    custom_hlgroups = custom,
}

function get_curr_lsps_str()
    local T = vim.lsp.buf_get_clients()
    local s = ''
    for k,v in pairs(T) do
        for k1, v1 in pairs(T[k]) do
            if k1 == 'name' then
                s = s..v1..' '
            end
        end
    end
    return vim.trim(s)
end

function get_rel_fname()
    local fname = vim.fn.expand('%')
    return fname
end

require('lualine').setup({
    options = {
        section_separators = {left = "", right = ""},
        theme = "base16",
        ignore_focus = {"neo-tree", "help"},
    },
    sections = {
        lualine_b = {'branch'}, --'diff'
        lualine_c = {'vim.fn.pathshorten(vim.fn.expand("%"))'}, --'diff'
        lualine_x = {'diagnostics', 'get_curr_lsps_str()', 'fileformat', 'filetype'},
        lualine_y = {},
    }
})

print(get_rel_fname())
-- vim.cmd('highlight GitSignsAddNr guibg='..ColorScale(palette.green,0.5)..' guifg='..custom.LineNr.fg)
-- vim.cmd('highlight GitSignsChangeNr guibg='..ColorScale(palette.blue,0.5)..' guifg='..custom.LineNr.fg)
