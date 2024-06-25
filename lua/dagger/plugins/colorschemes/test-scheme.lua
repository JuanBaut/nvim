return {
	"yashguptaz/calvera-dark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("calvera.functions").toggle_eob()
		vim.cmd.colorscheme("calvera")
	end,
}
