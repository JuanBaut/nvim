return {
	"j-hui/fidget.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		progress = {
			display = {
				done_ttl = 5,
				done_icon = " ",
			},
		},

		notification = {
			override_vim_notify = true,
			window = {
				x_padding = 0,
				y_padding = 0,
			},
		},
	},
}
