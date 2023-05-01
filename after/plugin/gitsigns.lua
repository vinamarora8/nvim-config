require('gitsigns').setup({})

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
