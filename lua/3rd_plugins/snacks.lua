local snacks = require("snacks")

snacks.setup
{
    bigfile = { enabled = true },
    dashboard = { enabled = false},
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
    projects = {enabled = false},
    picker = {
        formatters = {
            file = {
                filename_first = true,
            }
        }
    }
}

local stick_opt =
{
    auto_close = false,
    jump = {
        close = false,
    },
    layout = {
        preset = "bottom"
    }
}

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader>ff", snacks.picker.smart, { desc = "Smart Find Files" })
-- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
-- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
vim.keymap.set("n", "<leader>e", function() snacks.explorer() end, {desc = "File Explorer" })
-- find
vim.keymap.set("n", "<leader>sb", function() snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
-- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
-- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
-- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
-- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
-- git
-- vim.keymap.set("n", "<leader>gb", function() snacks.picker.git_branches() end, { desc = "Git Branches" })
-- vim.keymap.set("n", "<leader>gbl", function() snacks.git.blame_line() end, { desc = "Git Blame Line" })
-- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
-- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
vim.keymap.set("n", "<leader>gs", function() snacks.picker.git_status() end, { desc = "Git Status" })
-- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
vim.keymap.set("n", "<leader>gd", function() snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
-- { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
-- gh
-- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
-- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
-- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
-- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
-- Grep
-- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
vim.keymap.set("n", "<leader>Sg", function() snacks.picker.grep(stick_opt) end , { desc = "Grep" })
vim.keymap.set("n", "<leader>sg", function() snacks.picker.grep() end , { desc = "Grep" })

-- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
-- search
-- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
-- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
-- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
vim.keymap.set("n", "<leader>sl", function() snacks.picker.lines() end, { desc = "Buffer Lines" })
-- { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
-- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
vim.keymap.set("n", "<leader>sD", function() snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sd", function() snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>SD", function() snacks.picker.diagnostics(stick_opt) end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>Sd", function() snacks.picker.diagnostics_buffer(stick_opt) end, { desc = "Buffer Diagnostics" })
-- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
-- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
-- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
vim.keymap.set("n", "<leader>sj", function() snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() snacks.picker.keymaps() end, { desc = "Keymaps" })
-- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
vim.keymap.set("n", "<leader>sm", function() snacks.picker.marks() end, { desc = "Marks" })
-- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
-- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
vim.keymap.set("n", "<leader>sq", function() snacks.picker.qflist() end, { desc = "Quickfix List" })
-- { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
-- { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
vim.keymap.set("n", "<leader>cs", function() snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- LSP
vim.keymap.set("n", "gd", function() snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>fr", function() snacks.picker.lsp_references() end, { desc = "References" })
vim.keymap.set("n", "<leader>gi", function() snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
-- vim.keymap.set("n", "<leader>gy", function() snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>fic", function() snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "<leader>foc", function() snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
vim.keymap.set("n", "<leader>Fic", function() snacks.picker.lsp_incoming_calls(stick_opt) end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "<leader>Foc", function() snacks.picker.lsp_outgoing_calls(stick_opt) end, { desc = "C[a]lls Outgoing" })
vim.keymap.set("n", "<leader>fs", function() snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>Fs", function() snacks.picker.lsp_symbols(stick_opt) end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>fS", function() snacks.picker.lsp_workspace_symbols() end, {desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>FS", function() snacks.picker.lsp_workspace_symbols(stick_opt) end, {desc = "LSP Workspace Symbols" })
-- Other
-- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
-- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
-- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
-- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
vim.keymap.set("n", "<leader>n",  function() snacks.notifier.show_history() end, { desc = "Notification History" })
-- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
-- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
-- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
vim.keymap.set("n", "<leader>lg", function() snacks.lazygit() end, {desc = "Lazygit" })
-- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
vim.keymap.set({"n"}, "<leader>t", function() snacks.terminal() end, {desc = "Toggle Terminal" })
-- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
-- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
vim.keymap.set({"n"}, "<leader>sp", function() snacks.picker.pickers() end, {desc = "Snacks Pickers" })

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
            snacks.debug.inspect(...)
        end
        _G.bt = function()
            snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
                dd(...)
            end
        else
            vim.print = _G.dd
        end

        -- Create some toggle mappings
        -- snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        -- snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        -- snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        -- snacks.toggle.diagnostics():map("<leader>ud")
        -- snacks.toggle.line_number():map("<leader>ul")
        -- snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        -- snacks.toggle.treesitter():map("<leader>uT")
        -- snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        -- snacks.toggle.inlay_hints():map("<leader>uh")
        -- snacks.toggle.indent():map("<leader>ug")
        -- snacks.toggle.dim():map("<leader>uD")
    end,
})
