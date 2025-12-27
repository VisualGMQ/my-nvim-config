local dap, dapui, dap_virtual_text = require("dap"), require("dapui"), require("nvim-dap-virtual-text")

dapui.setup({})
dap_virtual_text.setup({})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- VERY IMPORTANT!!!!
-- If you want to use codelldb(I don't try other debuggers) under Windows, you must add environment variable `LLDB_USE_NATIVE_PDB_READER=1`
-- See: https://www.reddit.com/r/neovim/comments/1eeydfp/solving_codelldb_with_dap_not_picking_up_pdb
dap.adapters.codelldb = {
	type = "executable",
	command = "", -- mason-dap will auto find command
}

-- provide all .exe to choose
-- why not use snacks.picker? it is async so that dap will finish before you select file
local function search_executable()
    local files_str = vim.fn.globpath(vim.fn.getcwd(), "**/*.exe", '\n')
    if files_str == "" then
        print("No .exe files found in current directory")
        return nil
    end

    local files = {}
    for file in string.gmatch(files_str, "[^\n]+") do
        table.insert(files, file)
    end

    local choices = {}
    for i, file in ipairs(files) do
        table.insert(choices, i .. ". " .. vim.fn.fnamemodify(file, ":t"))
    end
    table.insert(choices, "Cancel")

    local choice = vim.fn.inputlist(choices)

    if choice > 0 and choice <= #files then
        return files[choice]
    else
        return nil
    end
end

dap.configurations.cpp = {
	{
		name = "Debug",
		type = "codelldb",
		request = "launch",
		program = search_executable,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

local dap_breakpoint_color = {
	breakpoint = {
		ctermbg = 0,
		fg = "#993939",
		bg = "#31353f",
	},
	logpoing = {
		ctermbg = 0,
		fg = "#61afef",
		bg = "#31353f",
	},
	stopped = {
		ctermbg = 0,
		fg = "#98c379",
		bg = "#31353f",
	},
}

-- dap symbols

vim.api.nvim_set_hl(0, "DapBreakpoint", dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, "DapLogPoint", dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, "DapStopped", dap_breakpoint_color.stopped)

local dap_breakpoint = {
	error = {
		text = "🔴",
		texthl = "DapBreakpoint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	condition = {
		text = "󰜋",
		texthl = "DapBreakpoint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	rejected = {
		text = "",
		texthl = "DapBreakpint",
		linehl = "DapBreakpoint",
		numhl = "DapBreakpoint",
	},
	logpoint = {
		text = "",
		texthl = "DapLogPoint",
		linehl = "DapLogPoint",
		numhl = "DapLogPoint",
	},
	stopped = {
		text = "",
		texthl = "DapStopped",
		linehl = "DapStopped",
		numhl = "DapStopped",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
vim.fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)

-- some keybinding

vim.keymap.set({ "n", "i", "v", "x" }, "<F9>", function()
	dap.toggle_breakpoint()
end, { desc = "Dap toggle breakpoint" })
vim.keymap.set({ "n", "i", "v", "x" }, "<F5>", function()
	dap.continue()
end, { desc = "Dap continue" })
vim.keymap.set({ "n", "i", "v", "x" }, "<F10>", function()
	dap.step_over()
end, { desc = "Dap step over" })
vim.keymap.set({ "n", "i", "v", "x" }, "<F11>", function()
	dap.step_into()
end, { desc = "Dap step into" })
vim.keymap.set({ "n", "i", "v", "x" }, "<S-F11>", function()
	dap.step_out()
end, { desc = "Dap step out" })
vim.keymap.set({ "n", "i", "v", "x" }, "<S-F9>", function()
	dap.toggle_repl()
end, { desc = "Dap toggle repl" })
vim.keymap.set({ "n", "i", "v", "x" }, "<F4>", function()
	dap.terminate()
end, { desc = "Dap terminate" })
vim.keymap.set({ "n", "i", "v", "x" }, "<F12>", function()
	dap.pause()
end, { desc = "Dap pause" })
