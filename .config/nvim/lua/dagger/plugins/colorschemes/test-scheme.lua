return {
	dir = "~/dev/neovim/lackluster.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	dev = true,
	lazy = false,
	priority = 1000,
	init = function()
		--local lackluster = require("lackluster")
		--lackluster.dev.create_usercmds()

		vim.keymap.set(
			"n",
			"<leader>0",
			"<cmd>lua require('lackluster').dev.lackluster_reload()<CR>",
			{ desc = "Reload lackluster" }
		)
		vim.cmd.colorscheme("lackluster")
	end,
}
