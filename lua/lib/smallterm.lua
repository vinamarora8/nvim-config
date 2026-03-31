-- Toggle-able terminal at the bottom of the screen

local M = {}

M._bufid = -1
M._winid = -1

M.config = {
  height = 15,
}

M.setup = function(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

M.open_or_focus = function()
  if not vim.api.nvim_win_is_valid(M._winid) then
    if not vim.api.nvim_buf_is_valid(M._bufid) then
      vim.cmd("new")
    else
      vim.cmd("split")
      vim.api.nvim_win_set_buf(0, M._bufid)
    end

    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
    M._winid = vim.api.nvim_get_current_win()
  else
    vim.api.nvim_set_current_win(M._winid)
  end

  if not vim.api.nvim_buf_is_valid(M._bufid) then
    vim.cmd.term()
    M._bufid = vim.api.nvim_get_current_buf()
  end

  vim.cmd.startinsert()
end

M.hide = function()
  if vim.api.nvim_win_is_valid(M._winid) then
    vim.api.nvim_win_hide(M._winid)
    M._winid = -1
  end
end

M.toggle = function()
  if vim.api.nvim_get_current_win() == M._winid then
    M.hide()
  else
    M.open_or_focus()
  end
end

return M
