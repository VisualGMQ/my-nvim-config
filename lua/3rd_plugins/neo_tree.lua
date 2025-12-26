require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_ignored = false, -- hide files that are ignored by other gitignore-like files
			-- other gitignore-like files, in descending order of precedence.
			ignore_files = {
				".neotreeignore",
				".ignore",
				-- ".rgignore"
			},
			hide_hidden = false, -- only works on Windows for hidden files/directories
			hide_by_name = {
				--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
			},
			always_show_by_pattern = { -- uses glob style patterns
				--".env*",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				--".DS_Store",
				--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
			},
		},
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every time
			--               -- the current file is changed while the tree is open.
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
	},
})

vim.keymap.set({ "n", "i", "v" }, "<C-t>", "<Cmd>Neotree filesystem toggle float<CR>")
vim.keymap.set({ "n", "i", "v" }, "<C-g>", "<Cmd>Neotree git_status toggle float<CR>")
