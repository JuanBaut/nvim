return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				border = "single",
			},
			select = {
				enabled = true,

				nui = {
					border = {
						style = "single",
					},
				},

				builtin = {
					border = "single",
				},
			},
		})
	end,
}
