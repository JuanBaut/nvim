return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = {
			[[                                                       ]],
			[[           ,__.==;:::::;.                              ]],
			[[            \;:;::::;';::.                .            ]],
			[[             :::::;     ;:.              /#\           ]],
			[[           ,:::::;       ;:             /###.          ]],
			[[           ::::::;       ;:            /#####.         ]],
			[[           ;:::::;       ;:           /#######.        ]],
			[[         ,;;::::::,     ,:'          / \#######.       ]],
			[[       ;;:::::::::;'...';:          /  / \######.      ]],
			[[     .;:;:;:::::::::::::::::;,     /  /    \#####.     ]],
			[[    .;:::::;:::::::::::::::::;,   /  /       \####.    ]],
			[[   ;`;::::::`':::::::::::::::; ;|/  /          +###.   ]],
			[[   ;`;:::::::`;::::::::::::; ;::|  /            \###.  ]],
			[[   ;:`;:::::::`;:::::::::; ;::::| /              ###|  ]],
			[[   ;::`;:::::::`:::::::; ;::::::|/                ##|  ]],
			[[   `;::`;:::::::`;::; ;:::::::::[                 #/   ]],
			[[    ;:::`;::::::::`;:::::::::::::]                /    ]],
			[[    `;::::`;:::::::::::::::::::::|                     ]],
			[[     `;::::`;::::::::::;'/  /`;::|                     ]],
			[[      ;:::::`;:::::::;' /  /   `'|                     ]],
			[[                                                       ]],
		}

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = logo,

				center = {
					{ action = "Lazy", desc = " lazy", icon = " " },
					{ action = "Mason", desc = " mason", icon = " " },
				},

				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "Reaper loaded " .. stats.loaded .. "/" .. stats.count .. " in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "DashboardLoaded",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		return opts
	end,
}
