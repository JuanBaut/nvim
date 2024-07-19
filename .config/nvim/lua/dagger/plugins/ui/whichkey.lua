return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		require("which-key").add({
			{ "<BS>", mode = "v", desc = "Decrement node" },
			{ "<S-Tab>", mode = { "v", "n" }, desc = "Increment node" },
			{ "S", mode = "v", desc = "Add surround visual" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>f", group = "Filetree" },
			{ "<leader>m", group = "Format or Linting" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>u", group = "Buffers" },
			{ "<leader>w", group = "Wins" },
		})
	end,
	opts = {
		preset = "helix",
		plugins = {
			presets = {
				windows = false,
			},
		},
		win = {
			height = { max = 20 },
			border = "single",
			padding = { 0, 1 },
		},
		keys = {
			scroll_down = "<c-f>",
			scroll_up = "<c-u>",
		},
		replace = {
			key = {
				{ "<BS>", "ret" },
				{ "<Space>", "spc" },
				{ "<S%-Tab>", "stab" },
			},
		},
		icons = {
			rules = false,
			separator = "→",
		},
		show_help = false,
	},
}
