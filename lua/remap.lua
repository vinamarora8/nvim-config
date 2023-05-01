vim.g.mapleader = " "

vim.keymap.set("n", "<leader>xf", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>xb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")

-- Close buffer without closing window
vim.keymap.set("n", "<leader>xk", ":bp<bar>sp<bar>bn<bar>bd<CR>", {desc = "Close buffer, keep window"})
vim.keymap.set("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", {desc = "Close buffer, keep window"})

vim.keymap.set("n", "<leader>n", ":noh<CR>", {desc = "Clear highlights"})

-- Sign column toggle
function ToggleSigncolumn()
    if vim.wo.signcolumn == "yes" then
        vim.wo.signcolumn = "no"
    else
        vim.wo.signcolumn = "yes"
    end
end
vim.keymap.set("n", "<leader>s", ":lua ToggleSigncolumn()<CR>", {desc = "Toggle sign column"})
