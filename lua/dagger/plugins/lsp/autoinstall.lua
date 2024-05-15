return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	enabled = true, -- disable this on nixos
	config = function()
		local tooling = require("mason-tool-installer")

		tooling.setup({
			ensure_installed = {
				--"nil",
				--"nixpkgs-fmt",

				"emmet-ls",
				"html-lsp",
				"css-lsp",
				"json-lsp",
				"cssmodules-language-server",
				"tailwindcss-language-server",

				"prettier",
				"eslint_d",

				"lua-language-server",
				"stylua",

				"beautysh",
				"shellcheck",

				"pyright",
				"black",
				"ruff",
				"mypy",
			},
		})
	end,
}
