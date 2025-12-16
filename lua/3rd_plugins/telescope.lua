-- trouble.nvim embed
local open_with_trouble = require("trouble.sources.telescope").open
local telescope = require("telescope")

-- setup
telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("refactoring")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "fs", builtin.lsp_dynamic_workspace_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })

vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Colorscehems" })

vim.keymap.set("n", "<leader>ggc", builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>ggb", builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>ggf", builtin.git_status, { desc = "Git Status" })

vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Definitions" })
vim.keymap.set("n", "fr", builtin.lsp_references, { desc = "References" })
vim.keymap.set("n", "fic", builtin.lsp_incoming_calls, { desc = "Incoming calls" })
vim.keymap.set("n", "foc", builtin.lsp_outgoing_calls, { desc = "Outgoing calls" })

vim.keymap.set( {"n", "x"}, "<leader>rr", function() require('telescope').extensions.refactoring.refactors() end)
