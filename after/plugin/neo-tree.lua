require("neo-tree").setup({
    window = {
        size = { width=15 }
    },
    filesystem = {
        use_libuv_file_watcher = true,
    }
})
