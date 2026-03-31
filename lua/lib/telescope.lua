local M = {}

--- Try to use git_files if in a git repo, otherwise fallback to find_files.
M.safe_git_files = function()
  if os.execute("git rev-parse HEAD 2> /dev/null 1> /dev/null") == 0 then
    vim.cmd("Telescope git_files")
    print("Showing git files")
  else
    vim.cmd("Telescope find_files")
    print("Showing all files (not in a git repo)")
  end
end

return M
