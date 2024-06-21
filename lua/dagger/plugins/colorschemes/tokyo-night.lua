return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = false,
			on_colors = function(colors)
				colors.bg = "#000000"
				colors.bg_dark = "#000000"
				colors.bg_float = "#000000"
				colors.bg_popup = "#000000"
				colors.bg_search = "#000000"
				colors.bg_sidebar = "#0A0A0A"
				colors.bg_statusline = "#0A0A0A"
			end,
		})

		vim.cmd.colorscheme("tokyonight-night")
	end,
}
