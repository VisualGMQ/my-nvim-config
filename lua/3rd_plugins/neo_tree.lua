require('neo-tree').setup({})

vim.keymap.set({"n", "i", "v"}, "<C-t>", "<Cmd>Neotree filesystem toggle float<CR>")
vim.keymap.set({"n", "i", "v"}, "<C-g>", "<Cmd>Neotree git_status toggle float<CR>")
