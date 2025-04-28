function GetCleanBufferPath()
    local full_path = vim.fn.expand("%")
    local project_path = vim.loop.cwd()
    local short_path = string.gsub(full_path, project_path, "")
    -- short_path = vim.fn.pathshorten(short_path)  -- if you want something like s/m/model.py
    return short_path
end

function GetCurrLspsStr()
    local T = vim.lsp.get_clients()
    local s = ""
    for k, _ in pairs(T) do
        for k1, v1 in pairs(T[k]) do
            if k1 == "name" then
                if v1 == "GitHub Copilot" then
                    v1 = "copilot"
                end
                s = s .. v1 .. " "
            end
        end
    end
    return vim.trim(s)
end

return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                section_separators = { left = "", right = "" },
                theme = "onedark",
                ignore_focus = { "neo-tree", "help" },
            },
            sections = {
                lualine_b = { "branch" }, --'diff'
                lualine_c = { "GetCleanBufferPath()" }, --'diff'
                lualine_x = { "diagnostics", "GetCurrLspsStr()", "filetype" },
                lualine_y = {},
            },
        },
    },
}
