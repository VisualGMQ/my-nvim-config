require("mason-lspconfig").setup{
        ensure_installed = {
                "clangd", "lua_ls",
        },
        automatic_enable = {
                "clangd",
                "lua_ls",
        }
}
