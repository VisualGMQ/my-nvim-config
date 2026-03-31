-- vim.opt.completeopt = "menuone,noinsert,noselect,preview"

require("blink.cmp").setup{
    completion = {
        keyword = { range = 'full' },
        accept = { auto_brackets = { enabled = false }, },
        menu = {
            auto_show = true,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
                border = 'single',
            },
        },
        ghost_text = { enabled = true },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true },
    keymap = {
        -- signature related
        ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
        ['<C-d>'] = { 'scroll_signature_down', 'fallback' },

        -- complete related
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-y>'] = { 'select_and_accept', 'fallback' },
    },
    cmdline = {
        enabled = true,
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
    }
}
