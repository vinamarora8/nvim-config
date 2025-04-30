-- code taken from:
-- https://www.reddit.com/r/neovim/comments/ol2vx4/how_to_toggle_quickfix_with_lua/

local M = {}

--- Toggles the quickfix window.
M.toggle_qf = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd("cclose")
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd("copen")
    else
        print("You tried to open the quickfix list, but it is empty")
    end
end

return M
