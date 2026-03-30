require("set")
require("lazy_init")
require("remap")

-- Autoreload files
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
  callback = function()
    local buftype = vim.bo.buftype
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

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
