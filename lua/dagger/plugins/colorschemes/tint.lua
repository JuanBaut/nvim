return {
	"folke/twilight.nvim",
	opts = {
		dimming = {
			alpha = 1,
			inactive = true,
			color = { "AerialGuide" },
		},
		treesitter = true,
		context = 1000,
		expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
			"function",
			"method",
			"table",
			"if_statement",
		},
	},
}
