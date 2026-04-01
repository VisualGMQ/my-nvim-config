---get compile_commands.json
---@return string|nil @dir of compile_commands
local function find_compile_commands(start_dir)
    local dir = start_dir or vim.fn.getcwd()
    local pattern = 'compile_commands.json'
    local file_path = vim.fn.findfile(pattern, dir .. '/**')
    if file_path ~= '' then
        return vim.fn.fnamemodify(file_path, ':p:h')
    end
    return nil
end

local compile_commands_dir = find_compile_commands(nil) or "cmake-build"

local enable_lsp = {
    lua_ls = {},
    luau_lsp = {},
    clangd = {
        cmd = {
            "clangd",
            "--clang-tidy",
            "--background-index",
            "--compile-commands-dir=" .. compile_commands_dir,
        },
    },
    neocmake = {
        cmd = { "neocmakelsp", "stdio" },
    },
}

for lsp, config in pairs(enable_lsp) do
    vim.lsp.config(lsp, config)
    vim.lsp.enable(lsp)
end
vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)

local function diagnostic_jump_show_float(_, bufnr)
    vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor" })
end

vim.keymap.set("n", "[g", function()
    vim.diagnostic.jump({ count = -vim.v.count1, on_jump = diagnostic_jump_show_float })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]g", function()
    vim.diagnostic.jump({ count = vim.v.count1, on_jump = diagnostic_jump_show_float })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>a", function()
    vim.lsp.buf.code_action({
        apply = true,
        context = {
            triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
        },
    })
end, { desc = "LSP code action" })

vim.keymap.set("n", "<leader>o", "<CMD>:LspClangdSwitchSourceHeader<CR>",
    { desc = "Switch cpp header & source file" })

vim.keymap.set("n", "==", function()
    MiniTrailspace.trim()
    vim.lsp.buf.format({ async = true })
end, { desc = "LSP format buffer" })

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
