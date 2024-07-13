return {
	"echasnovski/mini.icons",
	opts = {},
	lazy = true,
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		require("mini.icons").setup({
			filetype = {
				json = { glyph = "" },
				jsonc = { glyph = "" },

				sh = { glyph = "󰐣", hl = "MiniIconsBlue" },
				zsh = { glyph = "󰐣" },
				bash = { glyph = "󰐣" },
			},
			extension = {
				conf = { glyph = "󰛸", hl = "MiniIconsBlue" },
			},
		})
	end,
}
