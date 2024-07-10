return {
	dir = "~/dev/neovim/statuscolumn.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	lazy = false,
	dev = true,
	config = function()
		require("statuscolumn").setup({})
	end,
}
