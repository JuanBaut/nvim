return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = false,
			on_colors = function(colors)
				colors.bg = "#15141b"
				colors.bg_dark = "#15141b"
				colors.bg_float = "#15141b"
				colors.bg_popup = "#15141b"
				colors.bg_search = "#15141b"
				colors.bg_sidebar = "#15141b"
				colors.bg_statusline = "#15141b"
			end,
		})

		vim.cmd.colorscheme("tokyonight-night")
	end,
}
