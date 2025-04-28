require("set")
require("lazy_init")
require("remap")

-- Autoreload files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})


-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Remove trailing whitespace on save
local format_group = vim.api.nvim_create_augroup("FormatOptions", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
