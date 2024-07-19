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

				backend = { "fzf_lua", "fzf", "builtin", "nui" },

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
