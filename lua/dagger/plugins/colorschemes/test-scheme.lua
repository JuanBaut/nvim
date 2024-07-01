return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local lackluster = require("lackluster")

		local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9

		lackluster.setup({
			tweak_syntax = {
				string = "default",
				string_escape = "default",
				comment = "default",
				builtin = "default",
				type = "default",
				keyword = "default",
				keyword_return = "default",
				keyword_exception = "default",
			},

			tweak_background = {
				normal = "#000000",
				menu = "#000000",
				popup = "#000000",
			},
		})

		vim.cmd.colorscheme("lackluster-dark")
	end,
}
