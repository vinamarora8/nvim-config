require("remap")
require("set") require("plugins")

-- Autoreload files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.cmd('cd %:h')
vim.cmd('tabnew')
vim.cmd('tabclose')
