return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		indent = {
			char = "·",
			tab_char = "·",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
				"fzf",
			},
		},
	},
	main = "ibl",
}
