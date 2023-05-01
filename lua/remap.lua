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

-- Gitsigns
function MyGitSignsToggle()
    local gitsigns = require('gitsigns')
    gitsigns.toggle_numhl()
    gitsigns.toggle_deleted()
end
vim.keymap.set("n", "<leader>gg", MyGitSignsToggle, {desc = "Gitsigns: Toggle info"})
vim.keymap.set("n", "<leader>gih", require('gitsigns').select_hunk, {desc = "Gitsigns: Select hunk"})
vim.keymap.set("n", "<leader>gh", require('gitsigns').preview_hunk, {desc = "Gitsigns: Select hunk"})
vim.keymap.set({"n", "v"}, "<leader>gd", ":Gitsigns reset_hunk<CR>", {desc = "Gitsigns: Reset hunk"})
vim.keymap.set({"n", "v"}, "<leader>gs", ":Gitsigns stage_hunk<CR>", {desc = "Gitsigns: Stage hunk"})
vim.keymap.set("n", "<leader>gu", require('gitsigns').undo_stage_hunk, {desc = "Gitsigns: Undo stage hunk"})
vim.keymap.set("n", "<leader>gb", require('gitsigns').blame_line, {desc = "Gitsigns: Blame line"})
vim.keymap.set("n", "<leader>gn", require('gitsigns').next_hunk, {desc = "Gitsigns: Goto next hunk"})
vim.keymap.set("n", "<leader>gp", require('gitsigns').prev_hunk, {desc = "Gitsigns: Goto prev hunk"})
