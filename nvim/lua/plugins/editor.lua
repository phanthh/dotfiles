return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		opts = {
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
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
	},
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy", config = true },
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
	},

	-- "echasnovski/mini.bufremove",
	{ "gpanders/editorconfig.nvim", lazy = false, priority = 9999 },
	{ "windwp/nvim-spectre", cmd = "Spectre" },
}
