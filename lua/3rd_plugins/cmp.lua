-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	-- disbale completion in comment
	enabled = function()
		local disabled = false
		disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
		disabled = disabled or (vim.fn.reg_recording() ~= "")
		disabled = disabled or (vim.fn.reg_executing() ~= "")
		disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")
		return not disabled
	end,

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-J>"] = cmp.mapping.scroll_docs(-4),
		["<C-K>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					if luasnip.expandable() then
						luasnip.expand()
					elseif cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					end
				else
					fallback()
				end
			end,
			s = function(fallback)
				if luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end,
		}, { "i", "s" }),
		["<Tab>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() then
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					else
						cmp.select_next_item()
					end
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end,
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path", ["/"] = "${folder}" },
	}, {
		{ name = "buffer" },
        { name = 'nvim_lsp_signature_help' },
	}),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})
require("cmp_git").setup() ]]
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lsp_list = {
	"clangd",
	"rust-analyzer",
	"neocmake",
    "lemminx",
}

---get compile_commands.json
---@return string|nil @dir of compile_commands
local function find_compile_commands(start_dir)
    local dir = start_dir or vim.fn.getcwd()
    local pattern = 'compile_commands.json'
    local file_path = vim.fn.findfile(pattern, dir .. '/**')
    if file_path ~= '' then
        return vim.fn.fnamemodify(file_path, ':p:h')
    end
    return nil
end

local compile_commands_dir = find_compile_commands(nil) or "cmake-build"

local params = {
	clangd = {
		cmd = {
			"clangd",
			"--clang-tidy",
            "--background-index",
			"--compile-commands-dir=" .. compile_commands_dir,
		},
	},
    neocmake = {
        cmd = { "neocmakelsp", "stdio" }
    }
}

for _, v in ipairs(lsp_list) do
    vim.lsp.config(v, {
        capabilities = capabilities,
    })
    -- we don't use this due to mason-lspconfig did it
    -- vim.lsp.enable(v)
end

for k, v in pairs(params) do
    vim.lsp.config(k, v)
end
