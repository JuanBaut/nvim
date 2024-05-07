return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = {
			[[                                                       ]],
			[[           ..·:::::::::;.                              ]],
			[[            \:::::::;·;::.                .            ]],
			[[            ;:::::;     ;:.              /#·           ]],
			[[           ,:::::;       ;;             /###·          ]],
			[[           ;:::::;       ;;            /#####·         ]],
			[[           ;:::::;       ;;           /#######·        ]],
			[[         ,;:::::::.     .:'          / \#######·       ]],
			[[       ,;::::::::::'...':;          /  / \######·      ]],
			[[     ,;:;:;:::::::::::::::::;,     /  /    \#####·     ]],
			[[    ,;:::::;:::::::::::::::::;,   /  /       \####·    ]],
			[[   ;`;::::::`':::::::::::::::; ;|/  /          *###·   ]],
			[[   ;`;:::::::`;::::::::::::; ;::|  /            *###.  ]],
			[[   ;:`;:::::::`;:::::::::; ;::::| /              *##|  ]],
			[[   ;::`;:::::::`:::::::; ;::::::|/                ##|  ]],
			[[   `;::`;:::::::`;::; ;:::::::::[                 #/   ]],
			[[    ;:::`;::::::::`;:::::::::::::]                /    ]],
			[[    `;::::`;:::::::::::::::::::::|                     ]],
			[[     `;::::`;::::::::::;'/  /`;::|                     ]],
			[[      ;:::::`;:::::::;' /  /   `'|                     ]],
			[[                                                       ]],
			[[                                                       ]],
		}

		local opts = {
			theme = "doom",
			hide = {
				statusline = true,
			},
			config = {
				header = logo,

				center = {
					{ action = "FzfLua files", desc = "· search ·" },
				},

				footer = function()
					return { "To win any battle, you must fight as if you were already dead." }
				end,
			},
		}

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
