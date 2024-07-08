return {
	dir = "~/dev/neovim/lackluster.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	dev = true,
	lazy = false,
	priority = 1000,
	init = function()
		local lackluster = require("lackluster")

		lackluster.setup({
			tweak_pallet = {
				lack = "#c3e88d",
				luster = "#b4f9f8 ",
				orange = "default",
				yellow = "default",
				green = "default",
				blue = "default",
				red = "#ff757f",
				black = "default",
				gray1 = "default",
				gray2 = "default",
				gray3 = "default",
				gray4 = "default",
				gray5 = "default",
				gray6 = "default",
				gray7 = "default",
				gray8 = "default",
				gray9 = "default",
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
