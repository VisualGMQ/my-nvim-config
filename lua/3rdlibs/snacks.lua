local snacks = require("snacks")
snacks.setup{
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
}

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader>sf", function() snacks.picker.smart() end, { desc = "Smart Find Files"} )
-- { "<leader>,", function() snacks.picker.buffers() end, desc = "Buffers" },
vim.keymap.set("n", "<leader>sg", function() snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function() snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })
-- find
-- { "<leader>fb", function() snacks.picker.buffers() end, desc = "Buffers" },
vim.keymap.set("n", "<leader>sc", function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>sf", function() snacks.picker.files() end, { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>sg", function() snacks.picker.git_files() end, { desc = "Find Git Files" })
-- { "<leader>fp", function() snacks.picker.projects() end, desc = "Projects" },
-- { "<leader>fr", function() snacks.picker.recent() end, desc = "Recent" },
-- git
vim.keymap.set("n", "<leader>gb", function() snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() snacks.picker.git_log_file() end, { desc = "Git Log File" })
-- gh
-- { "<leader>gi", function() snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
-- { "<leader>gI", function() snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
-- { "<leader>gp", function() snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
-- { "<leader>gP", function() snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
-- Grep
-- { "<leader>sb", function() snacks.picker.lines() end, desc = "Buffer Lines" },
-- { "<leader>sB", function() snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
-- { "<leader>sg", function() snacks.picker.grep() end, desc = "Grep" },
-- { "<leader>sw", function() snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
-- search
-- { '<leader>s"', function() snacks.picker.registers() end, desc = "Registers" },
-- { '<leader>s/', function() snacks.picker.search_history() end, desc = "Search History" },
-- { "<leader>sa", function() snacks.picker.autocmds() end, desc = "Autocmds" },
-- { "<leader>sb", function() snacks.picker.lines() end, desc = "Buffer Lines" },
-- { "<leader>sc", function() snacks.picker.command_history() end, desc = "Command History" },
vim.keymap.set("n", "<leader>sC", function() snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() snacks.picker.marks() end, { desc = "Marks" })
-- { "<leader>sM", function() snacks.picker.man() end, desc = "Man Pages" },
-- vim.keymap.set("n", "<leader>sp", function() snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function() snacks.picker.qflist() end, { desc = "Quickfix List" })
-- { "<leader>sR", function() snacks.picker.resume() end, desc = "Resume" },
-- { "<leader>su", function() snacks.picker.undo() end, desc = "Undo History" },
vim.keymap.set("n", "<leader>cs", function() snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- LSP
vim.keymap.set("n", "gd", function() snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() snacks.picker.lsp_references() end, { desc = "References" })
vim.keymap.set("n", "gi", function() snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gci", function() snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "gco", function() snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename" })
vim.keymap.set("n", "<leader>ss", function() snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>sS", function() snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
-- remove some default mapping
vim.keymap.del('n', "grn")
vim.keymap.del('n', "grx")
vim.keymap.del('n', "grr")
vim.keymap.del({'n', 'x'}, "gra")
vim.keymap.del('n', "gri")
vim.keymap.del('n', "grt")
-- Other
-- { "<leader>z",  function() snacks.zen() end, desc = "Toggle Zen Mode" },
-- { "<leader>Z",  function() snacks.zen.zoom() end, desc = "Toggle Zoom" },
-- { "<leader>.",  function() snacks.scratch() end, desc = "Toggle Scratch Buffer" },
-- { "<leader>S",  function() snacks.scratch.select() end, desc = "Select Scratch Buffer" },
vim.keymap.set("n", "<leader>n", function() snacks.notifier.show_history() end, { desc = "Notification History" })
-- { "<leader>bd", function() snacks.bufdelete() end, desc = "Delete Buffer" },
-- { "<leader>cR", function() snacks.rename.rename_file() end, desc = "Rename File" },
-- { "<leader>gB", function() snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
vim.keymap.set("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
-- { "<leader>un", function() snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
vim.keymap.set("n", "<leader>t", function() snacks.terminal() end, { desc = "Toggle Terminal" })
-- { "<c-_>",      function() snacks.terminal() end, desc = "which_key_ignore" },
vim.keymap.set({"n", "t"}, "]]", function() snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({"n", "t"}, "[[", function() snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
