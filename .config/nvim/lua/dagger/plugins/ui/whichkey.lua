return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 180
	end,
	opts = {
		plugins = {
			presets = {
				motions = false,
				windows = false,
				nav = false,
			},
		},
		window = {
			border = "rounded",
		},
		key_labels = {
			["<space>"] = "SPC",
			["<cr>"] = "RET",
			["<tab>"] = "TAB",
			["<bs>"] = "BKS",
		},
	},
}
