require("mason-lspconfig").setup{
    ensure_installed = {
        "clangd", "lua_ls", "neocmake"
    },
    automatic_enable = {
        "clangd",
        "lua_ls",
        "neocmake",
        "lemminx",
    }
}
