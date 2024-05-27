return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},

	config = function()
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>fg",
			"<cmd>Neotree toggle focus float git_status<cr>",
			{ desc = "Git status with neotree" }
		)
		keymap.set(
			"n",
			"<leader>fe",
			"<cmd>Neotree toggle focus right reveal_force_cwd<cr>",
			{ desc = "Sidebar with neotree" }
		)

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			popup_border_style = "rounded",
			event_handlers = { -- Close neo-tree when opening a file.
				{
					event = "file_opened",
					handler = function()
						require("neo-tree").close_all()
					end,
				},
			},
			filesystem = {
				bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
				window = {
					mappings = {
						["n"] = "toggle_node",
						["<space>"] = "none",
					},
				},
				--filtered_items = {
				--	visible = true,
				--},
			},
		})
	end,
}
