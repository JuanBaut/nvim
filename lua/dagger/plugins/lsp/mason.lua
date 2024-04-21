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
				icons = {
					package_installed = "✓",
					package_pending = "󰁔",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
