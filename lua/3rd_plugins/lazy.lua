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

-- Force set plugins version. If no version, set tag. If no tag, then pull master branch by default
require("lazy").setup({
	spec = {
		{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000, version = "*" },
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, tag = "v0.10.0" },
		{ "neovim/nvim-lspconfig", lazy = true, version = "*" },

		-- debugger relate
		{ "mfussenegger/nvim-dap", lazy = true, version = "*" },
        {
            "theHamsta/nvim-dap-virtual-text",
            lazy = true,
			dependencies = { "mfussenegger/nvim-dap"},
        },
		{
			"rcarriga/nvim-dap-ui",
			version = "*",
            lazy = true,
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
		},

        -- LSP, DAP install & manager
		{ "mason-org/mason.nvim", lazy = true, opts = {}, version = "*" },
		{
			"mason-org/mason-lspconfig.nvim",
			lazy = true,
			version = "*",
			dependencies = {
				"mason-org/mason.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			lazy = true,
			version = "*",
			dependencies = {
				"mason-org/mason.nvim",
                 "mfussenegger/nvim-dap",
			},
		},
		{ "p00f/clangd_extensions.nvim", lazy = true },

		-- complete family
		{ "hrsh7th/cmp-nvim-lsp", lazy = false, version = "*" },
		{ "hrsh7th/cmp-buffer", lazy = false, version = "*" },
		{ "hrsh7th/cmp-path", lazy = false, version = "*" },
		{ "hrsh7th/cmp-cmdline", lazy = false, version = "*" },
		{ "hrsh7th/nvim-cmp", lazy = false, version = "*" },
        { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false, version = "*" },

		-- snip enigne
		{ "L3MON4D3/LuaSnip", lazy = false, version = "*" },

		-- util library
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true, version = "*" },

		-- fuzzy finding
		-- use native fzf to speedup finding
		-- {
		-- 	"nvim-telescope/telescope-fzf-native.nvim",
		-- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
		-- 	lazy = true,
		-- },
		-- -- fuzzy finding engine
		-- {
		-- 	"nvim-telescope/telescope.nvim",
		-- 	version = "*",
		-- 	lazy = true,
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"BurntSushi/ripgrep",
		-- 	},
		-- },
		{ "folke/snacks.nvim", version = "*", priority = 1000, lazy = false },

		-- status bar
		{ "nvim-lualine/lualine.nvim", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },

		-- more pretty diagnostic
		-- use snacks.nvim to instead
		-- {
		-- 	"folke/trouble.nvim",
		-- 	lazy = false,
		-- 	opts = {},
		-- 	cmd = "Trouble",
		-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
		-- 	version = "*",
		-- },

		-- background task manager
		-- NOTE: can't use it under Windows(OverseerRun will abort due to path find not correct)
		-- { 'stevearc/overseer.nvim', version = "v2.*", lazy = true },

		-- file explorer
		-- NOTE: I think this is no use..., I want to use Neotree when open empty nvim
		-- {
		-- 	"stevearc/oil.nvim",
		-- 	lazy = false,
		-- 	version = "*",
		-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
		-- },

		-- use Snacks.nvim to replace
		-- {
		-- 	"nvim-neo-tree/neo-tree.nvim",
		-- 	version = "*",
		-- 	lazy = false,
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"MunifTanjim/nui.nvim",
		-- 		"nvim-tree/nvim-web-devicons",
		-- 	},
		-- },

		-- pretty buffer line
		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", lazy = false },

		-- formatter
		{ "stevearc/conform.nvim", lazy = true, version = "*" },

		-- quick move & search
		{ "folke/flash.nvim", event = "VeryLazy", lazy = false, version = "*" },

		-- auto-pairs
		{ "windwp/nvim-autopairs", event = "InsertEnter", config = true, lazy = false, version = "*" },

		-- git relate
		-- use snacks.lua to instead
		-- { "lewis6991/gitsigns.nvim", lazy = false, version = "*" },

		-- refactory
		{
			"ThePrimeagen/refactoring.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
			},
			lazy = false,
			opts = {},
		},

		-- session
		-- due to nvim 0.11 bug, it will create multiple .shaDa file then cause error
		-- {
		-- 	"rmagatti/auto-session",
		-- 	lazy = false,
		-- 	tag = "v2.5.1",
		-- 	opts = {
		-- 		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- 	},
		-- },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})
