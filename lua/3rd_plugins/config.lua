require("3rd_plugins.lazy")
vim.cmd.colorscheme("catppuccin-mocha")

require("3rd_plugins.treesitter")
require("3rd_plugins.treesitter-context")
require("3rd_plugins.lspconfig")
require("3rd_plugins.snacks")
require("3rd_plugins.dap")
require("3rd_plugins.mason")
require("3rd_plugins.mason-lspconfig")
require("3rd_plugins.mason-dap")
require("3rd_plugins.cmp")
require("3rd_plugins.refactory")
require("3rd_plugins.lualine")
-- require("3rd_plugins.overseer")
require("3rd_plugins.neovide")
require("3rd_plugins.bufferline")
require("3rd_plugins.conform")
require("3rd_plugins.auto-pairs")
require("3rd_plugins.clangd_extension")
require("3rd_plugins.gitsigns")


-- diagnostic icon in gutter
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
