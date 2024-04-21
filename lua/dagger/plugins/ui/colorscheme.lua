return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			transparent = false,
			style = "storm",

			on_colors = function(colors)
				colors.bg = "#101010"
				colors.bg_dark = "#101010"
				colors.bg_float = "#101010"
				colors.bg_popup = "#101010"
				colors.bg_search = "#101010"
				colors.bg_sidebar = "#101010"
				colors.bg_statusline = "#101010"
			end,
		})

		vim.cmd.colorscheme("tokyonight")
	end,
}
