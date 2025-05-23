return {
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
            formatters_by_ft = {
                python = { "black" },
                lua = { "stylua" },
            },
        },
    },
}
