return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- or  branch = '0.1.x',
    lazy = false,
    derendencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                -- color_devicons = false,
                layout_config = {
                    width = 0.7,
                    horizontal = {
                        preview_width = 0.6,
                    },
                },
                mappings = {
                    i = {
                        ["<esc>"] = require("telescope.actions").close, -- Single escape exit
                    },
                },
            },
            pickers = {
                buffers = {
                    -- ignore_current_buffer = true,
                    sort_lastused = true,
                },
            },
        })
    end,
}
