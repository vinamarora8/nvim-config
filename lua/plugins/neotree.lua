return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            window = {
                width = 35,
            },
            filesystem = {
                use_libuv_file_watcher = true,
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_current",
            },
        },
    },
}
