local dashboard = require("dashboard")

dashboard.custom_header = {
	[[                           ▓▓▓▓▓▓▓     ]],
	[[                       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ]],
	[[                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[                   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[  ▓▓             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓ ▒▓▓▓▓▓▓▓▓▓]],
	[[▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓▓    ░▓▓▓▓▓▓▓▓▓]],
	[[  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ░▓▓▓▓▓▓▓▓▓]],
	[[    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓]],
	[[      ▓▓▓▓▓▓▓▓▓▓▓▓           ▓▓▓▓▓▓▓▓▓▓]],
	[[    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓]],
	[[  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ▒▓▓▓▓▓▓▓▓▓]],
	[[▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓▓    ▒▓▓▓▓▓▓▓▓▓]],
	[[▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓ ▒▓▓▓▓▓▓▓▓▓]],
	[[  ▓▓             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[                   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓]],
	[[                        ▓▓▓▓▓▓▓▓▓▓▓▓▓  ]],
	[[                          ▓▓▓▓▓▓▓      ]],
	[[                                       ]],
	[[             Start Editing             ]],
}

dashboard.custom_header = {}

dashboard.custom_footer = {
	[[            Visual Studio Code               ]],
	[[             Editing evolved                 ]],
}

dashboard.custom_center = {
	{ icon = "", desc = { "  File Browser       " }, action = "Telescope file_browser" },
	{ icon = "", desc = { "  Search Text        " }, action = "Telescope live_grep" },
	{ icon = "", desc = { "  Recent             " }, action = "Telescope oldfiles" },
	{ icon = "", desc = { "  Git Status         " }, action = "Telescope git_status" },
}
