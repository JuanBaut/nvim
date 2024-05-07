return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({})

		--keybinds
		local map = function(keys, type, desc)
			local command = function()
				if type == "" then
					print("hello")
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
