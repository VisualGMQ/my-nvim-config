local mason_dap = require("mason-nvim-dap")
mason_dap.setup{
    ensure_installed = { 'codelldb' },
    automatic_installation  = false,
    handlers = {}
}
