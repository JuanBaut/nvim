return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		symbol = "·",
	},

	init = function()
		vim.api.nvim_create_autocmd("FileType", {

			pattern = {
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
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
