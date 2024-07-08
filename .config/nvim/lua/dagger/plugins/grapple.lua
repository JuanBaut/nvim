return {
	"cbochs/grapple.nvim",
	config = function()
		local grapple = require("grapple")

		grapple.setup({
			icons = false,
			win_opts = {
				border = "rounded",
				width = 0.3,
				height = 0.2,
			},
		})

		vim.keymap.set("n", "ma", grapple.toggle, { desc = "Mark with grapple" })
		vim.keymap.set("n", "M", grapple.toggle_tags)

		-- User command
		vim.keymap.set("n", "m1", "<cmd>Grapple select index=1<cr>", { desc = "Grapple 1" })
		vim.keymap.set("n", "m2", "<cmd>Grapple select index=2<cr>", { desc = "Grapple 2" })
		vim.keymap.set("n", "m3", "<cmd>Grapple select index=3<cr>", { desc = "Grapple 3" })
		vim.keymap.set("n", "m3", "<cmd>Grapple select index=3<cr>", { desc = "Grapple 3" })
		vim.keymap.set("n", "m5", "<cmd>Grapple select index=5<cr>", { desc = "Grapple 5" })
		vim.keymap.set("n", "m6", "<cmd>Grapple select index=6<cr>", { desc = "Grapple 6" })

		require("which-key").register({
			["m"] = { name = "Grapple" },
			["M"] = { name = "Grapple menu" },
		})
	end,
}
