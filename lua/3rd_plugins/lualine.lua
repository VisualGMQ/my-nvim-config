require("lualine").setup({
	theme = "nightfly",
	sections = {
		lualine_c = { { "filename", path = 4 } },
	},
	inactive_sections = {
		lualine_c = {
			{ "filename", path = 4 },
		},
	},
})
