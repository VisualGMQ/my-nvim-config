-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- import your plugins
		-- { import = "plugins" },
		{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false },
		{ "https://github.com/neovim/nvim-lspconfig", lazy = true },
		{ "mason-org/mason.nvim", lazy = true, opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			lazy = true,
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
		},

		-- complete family
		{ "hrsh7th/cmp-nvim-lsp", lazy = false },
		{ "hrsh7th/cmp-buffer", lazy = false },
		{ "hrsh7th/cmp-path", lazy = false },
		{ "hrsh7th/cmp-cmdline", lazy = false },
		{ "hrsh7th/nvim-cmp", lazy = false },

		-- snip enigne
		{ "L3MON4D3/LuaSnip", lazy = false, version = "v2.*" },

		-- util library
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },

		-- fuzzy finding
		-- use native fzf to speedup finding
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
			lazy = true,
		},
		-- fuzzy finding engine
		{
			"nvim-telescope/telescope.nvim",
			tag = "v0.1.9",
			lazy = true,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"BurntSushi/ripgrep",
			},
		},

		-- status bar
		{ "nvim-lualine/lualine.nvim", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },

		-- more pretty diagnostic
		{
			"folke/trouble.nvim",
			lazy = false,
			opts = {},
			cmd = "Trouble",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},

		-- background task manager
		-- NOTE: can't use it under Windows(OverseerRun will abort due to path find not correct)
		-- { 'stevearc/overseer.nvim', version = "v2.*", lazy = true },

		-- file explorer
		{
			"stevearc/oil.nvim",
			dependencies = { { "nvim-tree/nvim-web-devicons" } },
			lazy = false,
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false, -- neo-tree will lazily load itself
		},

		-- debugger relate
		{ "mfussenegger/nvim-dap", lazy = true },
		{
			"rcarriga/nvim-dap-ui",
			version = "v4.*",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
		},

		-- pretty buffer line
		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", lazy = false },

		-- formatter
		{ "stevearc/conform.nvim", lazy = true },

		{ "folke/flash.nvim", event = "VeryLazy", lazy = false },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})
