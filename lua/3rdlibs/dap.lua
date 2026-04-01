local dap = require('dap')
local InstallLocation = require('mason-core.installer.InstallLocation')
local mason_path = require('mason-core.path')
local mason_registry = require('mason-registry')

--- Mason: `codelldb` → `packages/codelldb/extension/adapter/codelldb(.exe)`
local function codelldb_executable()
    local env = vim.env.CODELDB_PATH
    if env and env ~= '' and vim.fn.filereadable(env) == 1 then
        return env
    end
    if mason_registry.has_package('codelldb') then
        local pkg = mason_registry.get_package('codelldb')
        if pkg:is_installed() then
            local root = InstallLocation.global():package(pkg.name)
            local exe = vim.fn.has('win32') == 1 and 'codelldb.exe' or 'codelldb'
            return mason_path.concat { root, 'extension', 'adapter', exe }
        end
    end
    local ex = vim.fn.exepath('codelldb')
    if ex ~= '' then
        return ex
    end
    return nil
end

dap.adapters.codelldb = function(callback)
    local cmd = codelldb_executable()
    if not cmd then
        error('CodeLLDB not found, please use :Mason to install')
    end
    callback({
        type = 'executable',
        command = cmd,
        options = {
            cwd = vim.fn.fnamemodify(cmd, ':h'),
            detached = vim.fn.has('win32') ~= 1,
        },
    })
end

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Breakpoint: red circle (nvim-dap defaults to "B")
vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'ErrorMsg', linehl = '', numhl = '' })

local picker_util = require('snacks.picker.util')

-- recursive find .exe then launch by Dap
local function dap_new_pick_exe()
    local cwd = vim.fn.getcwd()
    require('snacks').picker.files({
        cwd = cwd,
        ft = 'exe',
        ignored = true,
        hidden = true,
        title = 'Dap: Pick executable (.exe)',
        confirm = function(picker, item)
            picker:close()
            if not item then
                return
            end
            local program = picker_util.path(item)
            if not program or program == '' then
                return
            end
            vim.schedule(function()
                dap.run({
                    name = 'Launch',
                    type = 'codelldb',
                    request = 'launch',
                    program = program,
                    cwd = cwd,
                    stopOnEntry = true,
                    args = {},
                }, { new = true })
            end)
        end,
    })
end

local function dap_commands_picker()
    ---@type { text: string, run: fun() }[]
    local items = {
        { text = 'Dap: Pick executable',            run = dap_new_pick_exe },
        { text = 'Dap: Pick launch configuration',  run = function() vim.cmd('DapNew') end },
        { text = 'Dap: Continue',                   run = function() dap.continue() end },
        { text = 'Dap: Terminate',                  run = function() dap.terminate() end },
        { text = 'Dap: Disconnect (keep debuggee)', run = function() dap.disconnect({ terminateDebuggee = false }) end },
        { text = 'Dap: Toggle breakpoint',          run = function() dap.toggle_breakpoint() end },
        { text = 'Dap: Clear breakpoints',          run = function() dap.clear_breakpoints() end },
        { text = 'Dap: Step over',                  run = function() dap.step_over() end },
        { text = 'Dap: Step into',                  run = function() dap.step_into() end },
        { text = 'Dap: Step out',                   run = function() dap.step_out() end },
        { text = 'Dap: Pause',                      run = function() dap.pause() end },
        { text = 'Dap: Run to cursor',              run = function() dap.run_to_cursor() end },
        { text = 'Dap: Restart frame',              run = function() dap.restart_frame() end },
        { text = 'Dap: Toggle REPL',                run = function() require('dap.repl').toggle() end },
        { text = 'Dap: Show log',                   run = function() vim.cmd('DapShowLog') end },
    }
    require('snacks').picker.pick({
        title = 'Dap: Commands',
        items = items,
        format = 'text',
        -- vscode preset sets outer border = "none"; select has a full rounded frame + title
        layout = {
            preset = 'select',
            hidden = { 'preview' },
            layout = { height = 0.55, min_height = 14, width = 0.45, min_width = 72 },
        },
        confirm = function(picker, item)
            picker:close()
            if item and item.run then
                vim.schedule(item.run)
            end
        end,
    })
end

local km = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>d', dap_commands_picker,
    vim.tbl_extend('force', km, { desc = 'Dap: Command menu' }))
vim.keymap.set('n', '<F3>', dap_new_pick_exe, vim.tbl_extend('force', km, { desc = 'Dap: Pick executable' }))
vim.keymap.set('n', '<F4>', function() dap.terminate() end, vim.tbl_extend('force', km, { desc = 'Dap: Terminate' }))
vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end,
    vim.tbl_extend('force', km, { desc = 'Dap: Toggle breakpoint' }))
vim.keymap.set('n', '<F5>', function() dap.continue() end, vim.tbl_extend('force', km, { desc = 'Dap: Continue' }))
vim.keymap.set('n', '<F10>', function() dap.step_over() end, vim.tbl_extend('force', km, { desc = 'Dap: Step over' }))
vim.keymap.set('n', '<F11>', function() dap.step_into() end, vim.tbl_extend('force', km, { desc = 'Dap: Step into' }))
vim.keymap.set('n', '<F8>', function() dap.run_to_cursor() end,
    vim.tbl_extend('force', km, { desc = 'Dap: Run to cursor' }))

---- dap ui
local dapui = require("dapui")
dapui.setup {}
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
