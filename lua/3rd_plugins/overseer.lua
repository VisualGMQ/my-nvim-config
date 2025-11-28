local overseer = require("overseer")
overseer.setup{}

vim.keymap.set('n', '<leader>bt',
        function()
                overseer.toggle({opts = {enter = true, direction = "bottom"}})
        end, { desc = "Background Tasks" })
