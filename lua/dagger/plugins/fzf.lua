return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			grep = {
				rg_opts = "--multiline",
			},
			hls = {
				border = "FloatBorder",
				preview_border = "FloatBorder",
			},
			winopts = {
				height = 0.7,
				row = 0.2,
				col = 0.5,
				preview = {
					layout = "vertical",
					vertical = "up:50%",
					scrollbar = false,
				},
			},
			winopts_fn = function()
				return {
					width = vim.o.columns > 100 and 0.46 or 0.8,
				}
			end,
		})

		--keybinds
		local map = function(keys, type, desc)
			local command = function()
				if type == "" then
					require("fzf-lua").builtin()
				else
					require("fzf-lua")[type]()
				end
			end
			vim.keymap.set("n", keys, command, { desc = desc })
		end

		map("<leader>sa", "", "FZF")
		map("<leader>sf", "files", "Files")
		map("<leader>sh", "help_tags", "Help")
		map("<leader>sb", "buffers", "Buffers")
		map("<leader>sg", "live_grep", "Grep Word")
		map("<leader>sv", "grep_visual", "Grep Visual")
		map("<leader>sr", "oldfiles", "Recent files")
		map("<leader>sc", "grep_cword", "Current Word")
		map("<leader>sd", "diagnostics_document", "Diagnostics")

		--lsp
		map("<leader>lr", "lsp_references", "LSP References")
		map("<leader>ld", "lsp_definitions", "LSP Definitions")
		map("<leader>li", "lsp_implementations", "LSP Implementations")
		map("<leader>lt", "lsp_typedefs", "LSP Type Definitions")
	end,
}
