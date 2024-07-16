return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				width = 0.95,
				height = 0.9,
				border = "single",
				icons = {
					package_installed = "¤",
					package_pending = "»",
					package_uninstalled = "×",
				},
			},
		})
	end,
}
