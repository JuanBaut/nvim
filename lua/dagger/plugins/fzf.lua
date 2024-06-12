return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		require("fzf-lua").setup({
			hls = {
				border = "FloatBorder",
				preview_border = "FloatBorder",
				header_text = "Comment",
				header_bind = "Comment",
				--normal = "FloatBorder",
				--title = "FloatBorder",
				--preview_normal = "FloatBorder",
				--preview_title = "FloatBorder",
				--cursor = "FloatBorder",
				--cursorline = "FloatBorder",
				--cursorlinenr = "FloatBorder",
				--search = "FloatBorder",
				--scrollborder_e = "FloatBorder",
				--scrollborder_f = "FloatBorder",
				--scrollfloat_e = "FloatBorder",
				--scrollfloat_f = "FloatBorder",
				--help_normal = "FloatBorder",
				--help_border = "FloatBorder",
				--path_colnr = "FloatBorder",
				--path_linenr = "FloatBorder",
				--buf_name = "FloatBorder",
				--buf_nr = "FloatBorder",
				--buf_flag_cur = "FloatBorder",
				--buf_flag_alt = "FloatBorder",
				--tab_title = "FloatBorder",
				--tab_marker = "FloatBorder",
				--dir_icon = "FloatBorder",
				--dir_part = "FloatBorder",
				--live_sym = "FloatBorder",
			},
			actions = {
				files = {
					["default"] = fzf.actions.file_edit,
					["ctrl-v"] = fzf.actions.file_split,
					["ctrl-s"] = fzf.actions.file_vsplit,
					["alt-q"] = fzf.actions.file_sel_to_qf,
				},
			},
			fzf_colors = {
				["fg"] = { "fg", "Comment" },
				["bg"] = { "bg", "Normal" },
				["hl"] = { "fg", "Special" },
				["fg+"] = { "fg", "Normal" },
				["bg+"] = { "bg", "CursorLine" },
				["hl+"] = { "fg", "Statement" },
				["info"] = { "fg", "PreProc" },
				["prompt"] = { "fg", "Comment" },
				["pointer"] = { "fg", "Exception" },
				["marker"] = { "fg", "Keyword" },
				["spinner"] = { "fg", "Label" },
				["header"] = { "fg", "Comment" },
				["gutter"] = { "bg", "Normal" },
			},
			winopts = {
				height = 0.7,
				width = 76,
				row = 0,
				col = 0.48,
				preview = {
					layout = "vertical",
					vertical = "up:44%",
					scrollbar = false,
				},
			},
		})

		--keybinds
		local map = function(keys, type, desc)
			local command = function()
				if type == "" then
					require("fzf-lua").builtin()
				elseif type == "files" then
					require("fzf-lua").files({
						git_icons = false,
						color_icons = false,
					})
				else
					require("fzf-lua")[type]()
				end
			end
			vim.keymap.set("n", keys, command, { desc = desc })
		end

		map("<leader>sa", "", "FZF")
		map("<leader>sf", "files", "Files")
		map("<leader>sh", "help_tags", "Help")
		map("<leader>sb", "buffers", "Buffers")
		map("<leader>sg", "live_grep", "Grep Word")
		map("<leader>sv", "grep_visual", "Grep Visual")
		map("<leader>sr", "oldfiles", "Recent files")
		map("<leader>sc", "grep_cword", "Current Word")
		map("<leader>sd", "diagnostics_document", "Diagnostics")

		--lsp
		map("<leader>lr", "lsp_references", "LSP References")
		map("<leader>ld", "lsp_definitions", "LSP Definitions")
		map("<leader>li", "lsp_implementations", "LSP Implementations")
		map("<leader>lt", "lsp_typedefs", "LSP Type Definitions")
	end,
}
