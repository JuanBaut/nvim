return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.formatters.prettierd = {
			stdin = true,
			env = {
				PRETTIERD_LOCAL_PRETTIER_ONLY = true,
			},
			args = { vim.api.nvim_buf_get_name(0) },
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },

				lua = { "stylua" },
				sh = { "beautysh" },
				python = { "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
				async = false,
			},
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Make Pretty" })
	end,
}
