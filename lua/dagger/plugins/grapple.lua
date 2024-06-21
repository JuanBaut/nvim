return {
	"cbochs/grapple.nvim",
	dependencies = {},
	config = function()
		vim.keymap.set("n", "ma", require("grapple").toggle, { desc = "Toggle to grapple" })
		vim.keymap.set("n", "M", require("grapple").toggle_tags)

		-- User command
		vim.keymap.set("n", "m1", "<cmd>Grapple select index=1<cr>", { desc = "Grapple 1" })
		vim.keymap.set("n", "m2", "<cmd>Grapple select index=2<cr>", { desc = "Grapple 2" })
		vim.keymap.set("n", "m3", "<cmd>Grapple select index=3<cr>", { desc = "Grapple 3" })
		vim.keymap.set("n", "m4", "<cmd>Grapple select index=4<cr>", { desc = "Grapple 4" })

		require("which-key").register({
			["m"] = { name = "Grapple" },
			["M"] = { name = "Grapple menu" },
		})
	end,
}
