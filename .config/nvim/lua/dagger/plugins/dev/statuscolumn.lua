return {
	"JuanBaut/statuscolumn.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	lazy = false,
	config = function()
		require("statuscolumn").setup({
			gradient_hl = "PreProc",
		})
	end,
}
