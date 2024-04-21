return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<S-Tab>"] = actions.move_selection_previous,
						["<Tab>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files theme=dropdown<cr>", { desc = "Files" })
		keymap.set("n", "<leader>sb", "<cmd>Telescope buffers theme=dropdown<cr>", { desc = "Buffers" })
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles theme=dropdown<cr>", { desc = "Recent files" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep theme=dropdown<cr>", { desc = "Grep Word" })
		keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string theme=dropdown<cr>", { desc = "Current Word" })
		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags theme=dropdown<cr>", { desc = "Help" })
		keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics theme=dropdown<cr>", { desc = "Diagnostics" })
	end,
}
