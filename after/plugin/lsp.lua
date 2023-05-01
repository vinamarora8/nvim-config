local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
  "clangd",
  "pyright",
  "lua_ls",
})

lsp.set_sign_icons({
  error = '⊙',
  warn = 'W',
  hint = 'H',
  info = 'I'
})


local diagnostic_opts = {
    underline = true,
    virtual_text = false,  -- No light text in buffer showing errors
    signs = true,
    update_in_insert = true,
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)


lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})

    vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, {desc = "LSP: Workspace Symbol"})
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, {desc = "LSP: Show diagnostic"})

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
