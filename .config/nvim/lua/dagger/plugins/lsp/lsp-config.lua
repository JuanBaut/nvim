return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),

			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
				end

				map("<leader>lw", vim.lsp.buf.hover, "Documentation over Word")
				map("<leader>lc", vim.lsp.buf.code_action, "List Code actions")
				map("<leader>rn", vim.lsp.buf.rename, "Smart rename")

				-- Diagnostics
				map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
				map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
				map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
			end,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = {
			zls = {},
			nil_ls = {},
			pyright = {},
			emmet_ls = {},
			html = {},
			jsonls = {},
			cssmodules_ls = {},
			tailwindcss = {},
			eslint = {},
			cssls = {
				settings = {
					css = { validate = true, lint = {
						unknownAtRules = "ignore",
					} },
					scss = { validate = true, lint = {
						unknownAtRules = "ignore",
					} },
					less = { validate = true, lint = {
						unknownAtRules = "ignore",
					} },
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
					},
				},
				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
			},
			-- clangd = {},
			-- gopls = {},
			-- rust_analyzer = {},
		}

		local function bind_lsp(server_name, server_config)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			server_config.capabilities = vim.tbl_deep_extend(
				"force",
				{},
				capabilities,
				require("cmp_nvim_lsp").default_capabilities(),
				server_config.capabilities or {}
			)
			require("lspconfig")[server_name].setup(server_config)
		end

		-- Automatically set up all language servers defined in the `servers` table
		for server_name, server_config in pairs(servers) do
			bind_lsp(server_name, server_config)
		end

		--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		--	border = "single",
		--})
	end,
}
