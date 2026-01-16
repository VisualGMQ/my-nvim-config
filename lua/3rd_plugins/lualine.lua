require("lualine").setup({
	theme = "nightfly",
	sections = {
		lualine_c = { { "filename", path = 4 } },
		lualine_x = { "overseer" },
	},
	inactive_sections = {
		lualine_c = {
			{ "filename", path = 4 },
		},
	},
})
