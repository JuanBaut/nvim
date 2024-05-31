return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	enabled = true, -- disable this on nixos
	config = function()
		local tooling = require("mason-tool-installer")

		tooling.setup({
			ensure_installed = {
				--"zls",
				--"nil",
				--"nixpkgs-fmt",
				--"prettier",
				--"prettierd",
				--"eslint_d",

				"eslint-lsp",
				"emmet-ls",
				"html-lsp",
				"css-lsp",
				"json-lsp",
				"cssmodules-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",

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
