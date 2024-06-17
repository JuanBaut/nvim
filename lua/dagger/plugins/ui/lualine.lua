local lint_progress = function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return ""
	end
	return " " .. table.concat(linters, ", ")
end

local grapple = function()
	local is_marked = package.loaded["grapple"] and require("grapple").exists()
	if is_marked == false then
		return ""
	end
	return "󰛢 " .. require("grapple").name_or_index()
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			globalstatus = true,
			disabled_filetypes = {
				"alpha",
			},

			--component_separators = { left = "", right = "" },
			--section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					"filename",
					symbols = { modified = " ", readonly = " ", unnamed = "No name", newfile = "New file" },
				},
			},
			lualine_b = {
				{ "branch", icon = { " ", align = "right" } },
				grapple,
			},
			lualine_c = { lint_progress },
			lualine_x = {
				{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
			},
			lualine_y = {
				"progress",
			},
			lualine_z = {
				{ "filetype", colored = false, icon = { align = "right" } },
			},
		},
		extensions = {
			"nvim-tree",
			"neo-tree",
			"mason",
			"lazy",
			"fzf",
		},
	},
}
