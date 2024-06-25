-- I might be overly verbose but I am learning !!!
local function modify_hl(highlight, opts)
	local success, options = pcall(vim.api.nvim_get_hl, 0, { name = highlight })

	if success then
		for index, value in pairs(opts) do
			options[index] = value
		end

		vim.api.nvim_set_hl(0, highlight, options)
	end
end

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		--modify_hl("EndOfBuffer", { link = "FloatBorder" })
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
