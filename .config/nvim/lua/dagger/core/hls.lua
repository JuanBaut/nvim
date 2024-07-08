local function modify_hl(highlight, opts)
	local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = highlight })
	if not ok then
		vim.notify("Failed to get highlight " .. highlight, vim.log.levels.ERROR)
		return
	end

	local new_hl = vim.tbl_extend("force", current, opts)

	pcall(vim.api.nvim_set_hl, 0, highlight, new_hl)
end

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		modify_hl("FloatBorder", { link = "Normal" })
		modify_hl("WinSeparator", { link = "FloatBorder" })
		modify_hl("NeoTreeDirectoryIcon", { link = "Function" })
		modify_hl("NeoTreeDirectoryName", { link = "Function" })

		modify_hl("NeoTreeGitUnstaged", { link = "Changed" })
		modify_hl("NeoTreeGitModified", { link = "Changed" })

		modify_hl("NeoTreeGitUntracked", { link = "Added" })
		modify_hl("NeoTreeGitRenamed", { link = "Added" })
		modify_hl("NeoTreeGitConflict", { link = "Removed" })
	end,
})
