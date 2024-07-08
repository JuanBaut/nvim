return {
	dir = "~/dev/neovim/lackluster.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	dev = true,
	lazy = false,
	priority = 1000,
	init = function()
		local lackluster = require("lackluster")

		lackluster.setup({
			-- ('default' is default) ('#ffaaff' is a custom colorcode)
			tweak_pallet = {
				lack = "#c3e88d", -- works in lualine
				luster = "#b4f9f8 ", -- doesnt work in syntax
				orange = "default",
				yellow = "default",
				green = "default",
				blue = "default",
				red = "#ff757f", -- doesnt work in errors
				black = "default",
				gray1 = "default",
				gray2 = "default",
				gray3 = "default",
				gray4 = "default",
				gray5 = "default",
				gray6 = "default",
				gray7 = "default",
				gray8 = "default",
				gray9 = "default", -- some of the gray values get chaged
			},
		})

		vim.cmd.colorscheme("lackluster")
		vim.keymap.set(
			"n",
			"<leader>0",
			"<cmd>lua require('lackluster').dev.lackluster_reload()<CR>",
			{ desc = "Reload lackluster" }
		)
	end,
}
