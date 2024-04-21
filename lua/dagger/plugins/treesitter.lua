return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
					enable_rename = false,
				},
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"svelte",

					"gitignore",
					"query",

					"markdown",
					"markdown_inline",

					"bash",
					"python",

					"vim",
					"vimdoc",

					"luadoc",
					"lua",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<S-TAB>",
						node_incremental = "<S-TAB>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
