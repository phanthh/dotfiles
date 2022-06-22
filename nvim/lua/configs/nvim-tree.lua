require("nvim-tree").setup({
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_opened_files = "all",
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})
