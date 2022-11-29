local iron = require("iron.core")

iron.setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			python = {
				command = { "python3" },
			},
		},
		repl_open_cmd = require("iron.view").split("33%"),
	},
	keymaps = {
		send_motion = "<leader>sc",
		visual_send = "<leader>sc",
		send_file = "<leader>sf",
		send_line = "<leader>sl",
		send_mark = "<leader>sm",
		mark_motion = "<leader>mc",
		mark_visual = "<leader>mc",
		remove_mark = "<leader>md",
		cr = "<leader>s<cr>",
		interrupt = "<leader>s<space>",
		exit = "<leader>sq",
		clear = "<leader>cl",
	},
	highlight = {
		italic = false,
	},
	ignore_blank_lines = true,
})

-- iron also has a list of commands, see :h iron-commands for all available commands
