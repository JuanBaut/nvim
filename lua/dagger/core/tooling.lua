local function linting()
	vim.cmd("lua require('lint').try_lint()")
end

local function delayed_lint()
	local timer = vim.loop.new_timer()
	local delay = 500
	timer:start(delay, 0, vim.schedule_wrap(linting))
end

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		vim.keymap.set("n", "<leader>lI", function()
			vim.cmd("TSToolsOrganizeImports")
			vim.cmd("TSToolsAddMissingImports")
			delayed_lint()
		end, { desc = "Organize and Add imports" })
	end,
})
