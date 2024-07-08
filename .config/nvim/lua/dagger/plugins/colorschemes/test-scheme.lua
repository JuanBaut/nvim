return {
	dir = "~/dev/neovim/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local lackluster = require("lackluster")

		--local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9

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

			--tweak_background = {
			--	normal = "#222436",
			--	menu = "#222436",
			--	popup = "#222436",
			--},
		})

		vim.cmd.colorscheme("lackluster")
	end,
}
