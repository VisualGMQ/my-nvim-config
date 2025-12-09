local gitsigns = require("gitsigns")

gitsigns.setup({})

vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame)
vim.keymap.set("n", "<leader>gw", gitsigns.toggle_word_diff)
