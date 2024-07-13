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
	config = function()
		local function highlight(name, option)
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

		local colors = {
			white = highlight("PreProc", "fg"),
			red = highlight("Constant", "fg"),
			green = highlight("Character", "fg"),
			blue = highlight("@property", "fg"),
			yellow = highlight("Function", "fg"),
			grey = highlight("SignColumn", "fg"),

			dark = highlight("StatusLineNc", "bg"),
		}

		require("lualine").setup({
			options = {
				theme = {
					normal = {
						a = { bg = colors.dark, fg = colors.white, gui = "bold" },
						b = { bg = colors.dark, fg = colors.white },
						c = { bg = colors.dark, fg = colors.white },
					},
					insert = {
						a = { bg = colors.dark, fg = colors.blue, gui = "bold" },
						b = { bg = colors.dark, fg = colors.blue },
						c = { bg = colors.dark, fg = colors.blue },
					},
					visual = {
						a = { bg = colors.dark, fg = colors.red, gui = "bold" },
						b = { bg = colors.dark, fg = colors.red },
						c = { bg = colors.dark, fg = colors.red },
					},
					replace = {
						a = { bg = colors.dark, fg = colors.green, gui = "bold" },
						b = { bg = colors.dark, fg = colors.green },
						c = { bg = colors.dark, fg = colors.green },
					},
					command = {
						a = { bg = colors.dark, fg = colors.yellow, gui = "bold" },
						b = { bg = colors.dark, fg = colors.yellow },
						c = { bg = colors.dark, fg = colors.yellow },
					},
					inactive = {
						a = { bg = colors.dark, fg = colors.gray, gui = "bold" },
						b = { bg = colors.dark, fg = colors.gray },
						c = { bg = colors.dark, fg = colors.gray },
					},
				},
				icons_enabled = true,
				globalstatus = true,
				disabled_filetypes = {
					"alpha",
				},

				component_separators = { left = "─", right = "─" },
				section_separators = { left = "─", right = "─" },
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
					{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
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
		})
	end,
}
