return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		-- Documenting with which-key
		require("which-key").add({
			{ "<BS>", mode = "v", desc = "Decrement node" },
			{ "<S-Tab>", mode = { "v", "n" }, desc = "Increment node" },
			{ "S", mode = "v", desc = "Add surround visual" },
			{ "<leader>l", group = "LSP" },
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
				{ "<S-Tab>", "tab" },
			},
		},
		icons = {
			rules = false,
			separator = "→",
			--keys = {
			--	Up = "↑ ",
			--	Down = "↓ ",
			--	Left = "← ",
			--	Right = "→ ",
			--	C = "ctr ",
			--	M = "met ",
			--	S = "sft ",
			--	CR = "ret ",
			--	Esc = "esc ",
			--	ScrollWheelDown = "M↓ ",
			--	ScrollWheelUp = "M↑ ",
			--	NL = "new ",
			--	BS = "del ",
			--	Space = "spc ",
			--	Tab = "tab ",
			--},
		},
		show_help = false,
	},
}
