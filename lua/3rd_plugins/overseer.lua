local overseer = require("overseer")
overseer.setup()

vim.keymap.set("n", "<leader>b", function()
	overseer.toggle({ direction = "bottom" })
end, { desc = "Toggle overseer window" })

vim.keymap.set("n", "<leader>rc", "<CMD>OverseerShell<CR>", { desc = "Run command in overseer" })
vim.keymap.set("n", "<leader>rt", "<CMD>OverseerRun<CR>", { desc = "Run overseer task" })
