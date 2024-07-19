local function modify_hl(highlight, opts)
	local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = highlight })
	if not ok then
		vim.notify("Failed to get highlight " .. highlight, vim.log.levels.ERROR)
		return
	end

	local new_hl = vim.tbl_extend("force", current, opts)

	pcall(vim.api.nvim_set_hl, 0, highlight, new_hl)
end

function Get_hl_hex(name, option)
	if type(name) ~= "string" or (option ~= "fg" and option ~= "bg") then
		error("Invalid arguments. Usage: highlight(name: string, option: 'fg' | 'bg')")
	end
	local hl = vim.api.nvim_get_hl(0, { name = name })
	local color = hl[option]
	if not color then
		print("No " .. option .. " color found for highlight group: " .. name)
		return nil
	end
	local hex_color = string.format("#%06x", color)
	return hex_color
end

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		modify_hl("CursorLine", { link = "None" })
		modify_hl("WinSeparator", { link = "FloatBorder" })
		modify_hl("DiagnosticUnnecessary", { underline = true })

		modify_hl("FlashLabel", { bg = Get_hl_hex("PreProc", "fg"), fg = Get_hl_hex("FloatBorder", "bg") })
		modify_hl("FlashBackdrop", { link = "SignColumn" })

		modify_hl("NeoTreeCursorLine", { link = "CursorColumn" })
		modify_hl("NeoTreeDirectoryIcon", { link = "Function" })
		modify_hl("NeoTreeDirectoryName", { link = "Function" })

		modify_hl("NeoTreeGitUnstaged", { link = "Changed" })
		modify_hl("NeoTreeGitModified", { link = "Changed" })

		modify_hl("NeoTreeGitUntracked", { link = "Added" })
		modify_hl("NeoTreeGitRenamed", { link = "Added" })
		modify_hl("NeoTreeGitConflict", { link = "Removed" })
	end,
})
