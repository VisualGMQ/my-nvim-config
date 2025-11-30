-- some lsp jump commands, even though not lspconfig's inner features
vim.keymap.set("n", "]g", function()
    vim.diagnostic.jump({count = 1, float = true})
end)
vim.keymap.set("n", "[g", function()
    vim.diagnostic.jump({count = -1, float = true})
end)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)

vim.lsp.inlay_hint.enable(true)
