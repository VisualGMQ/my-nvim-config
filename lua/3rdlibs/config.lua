-- require("3rdlibs.lazy")
vim.pack.add({
   "https://github.com/catppuccin/nvim",
   "https://github.com/nvim-treesitter/nvim-treesitter", 
   { src = "https://github.com/saghen/blink.cmp", version = "1.10.*" },
   "https://github.com/nvim-lualine/lualine.nvim",
   { src = "https://github.com/neovim/nvim-lspconfig", version = "v2.7.0" },
   { src = "https://github.com/folke/snacks.nvim", version = "v2.31.0" },
   { src = "https://github.com/nvim-mini/mini.nvim", version = "v0.17.0" },
   { src = "https://github.com/mason-org/mason.nvim", version = "v2.2.1" },
})

vim.o.background = "dark"
vim.cmd.colorscheme("catppuccin-mocha")

require("3rdlibs.treesitter")
require("3rdlibs.status_line")
require("3rdlibs.blink")
require("3rdlibs.lsp")
require("3rdlibs.snacks")
require("3rdlibs.mason")
require("3rdlibs.mini")
