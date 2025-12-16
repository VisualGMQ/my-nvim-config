local auto_session = require("auto-session")
auto_session.setup({
	enabled = false, -- Enables/disables auto creating, saving and restoring
	auto_save = false, -- Enables/disables auto saving session on exit
	auto_restore = false, -- Enables/disables auto restoring session on start
	auto_create = false,
	session_lens = {
		picker = "telescope",
		mappings = {
			delete_session = { "i", "<C-d>" },
			alternate_session = { "i", "<C-s>" },
			copy_session = { "i", "<C-y>" },
		},

		picker_opts = {
			border = true,
			layout_config = {
				width = 0.8,
				height = 0.5,
			},
		},

		load_on_setup = true,
	},
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Will use Telescope if installed or a vim.ui.select picker otherwise
vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession search<CR>", { desc = "Session search" })
vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })
