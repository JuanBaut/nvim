return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		require("nvim-highlight-colors").setup({
			render = "vitual",
			virtual_symbol = " ",
		})
	end,
}
