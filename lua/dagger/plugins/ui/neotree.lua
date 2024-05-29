return {
	"nvim-neo-tree/neo-tree.nvim",
	--enabled = false,
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
			"<leader>fe",
			"<cmd>Neotree toggle focus right reveal_force_cwd<cr>",
			{ desc = "Sidebar with neotree" }
		)

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 0,
				},
				icon = {
					folder_closed = "󰉋",
					folder_open = "󰝰",
					folder_empty = "󰉖",
					highlight = "AerialGuide",
				},
				modified = {
					symbol = "",
				},
				diagnostics = {
					symbols = {
						hint = "",
						info = "",
						warn = "",
						error = "",
					},
				},
				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						unstaged = "",
						ignored = "",
						staged = "",
						conflict = "",
					},
				},
			},

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
				filtered_items = {
					group_empty_dirs = true,
					never_show = {
						".DS_Store",
					},
				},
				bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
				window = {
					mappings = {
						["n"] = "toggle_node",
						["<space>"] = "none",
					},
				},
			},
		})
	end,
}
