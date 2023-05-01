vim.g.mapleader = " "

vim.keymap.set("n", "<leader>xf", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>xb", ":Telescope buffers<CR>")

-- Close buffer without closing window
vim.keymap.set("n", "<leader>xk", ":bp<bar>sp<bar>bn<bar>bd<CR>", {desc = "Close buffer, keep window"})
vim.keymap.set("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", {desc = "Close buffer, keep window"})

vim.keymap.set("n", "<leader>n", ":noh<CR>", {desc = "Clear highlights"})

