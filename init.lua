require("set")
require("lazy_init")
require("remap")

-- Autoreload files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    callback = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype ~= "quickfix" and buftype ~= "nofile" and vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
    pattern = { "*" },
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("clean-ws-on-save", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
