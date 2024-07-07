return {
	"utilyre/barbecue.nvim",
	enabled = false,
	name = "barbecue",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- configurations go here
	},
}
