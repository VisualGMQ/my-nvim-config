local enable_lsp = {
    lua_ls = {},
    clangd = {},
}

for lsp, config in pairs(enable_lsp) do
    vim.lsp.config(lsp, config)
    vim.lsp.enable(lsp)
end

local function diagnostic_jump_show_float(_, bufnr)
    vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor' })
end

vim.keymap.set('n', '[g', function()
    vim.diagnostic.jump({ count = -vim.v.count1, on_jump = diagnostic_jump_show_float })
end, { desc = 'Previous diagnostic' })

vim.keymap.set('n', ']g', function()
    vim.diagnostic.jump({ count = vim.v.count1, on_jump = diagnostic_jump_show_float })
end, { desc = 'Next diagnostic' })

vim.keymap.set('n', '<leader>a', function()
    vim.lsp.buf.code_action({
        apply = true,
        context = {
            triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
        },
    })
end, { desc = 'LSP code action' })

vim.keymap.set('n', '==', function()
    MiniTrailspace.trim()
    vim.lsp.buf.format({ async = true })
end, { desc = 'LSP format buffer' })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "◇",
            [vim.diagnostic.severity.HINT] = "✦",
        },
    },
})
