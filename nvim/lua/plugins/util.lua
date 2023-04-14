return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		opts = {
			border = "single",
			style = "dark",
			pager = false,
			width_ratio = 0.9,
			height_ratio = 0.9,
		},
	},
	{
		"NTBBloodbath/rest.nvim",
		ft = { "http" },
		opts = {
			result_split_horizontal = true,
		},
	},

	{
		"numToStr/Navigator.nvim",
		cmd = { "NavigatorLeft", "NavigatorRight", "NavigatorUp", "Navigatordown" },
		config = true,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			user_default_options = {
				names = false,
				hsl_fn = true,
			},
		},
	},

	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
		config = function()
			require("chatgpt").setup({
				keymaps = {
					submit = "<C-x>",
					close = { "<C-c>" },
					yank_last = "<C-y>",
					yank_last_code = "<C-k>",
					scroll_up = "<C-u>",
					scroll_down = "<C-d>",
					toggle_settings = "<C-o>",
					new_session = "<C-n>",
					cycle_windows = "<Tab>",
					-- in the Sessions pane
					select_session = "<Space>",
					rename_session = "r",
					delete_session = "d",
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"dpayne/CodeGPT.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		},
		config = function()
			require("codegpt.config")
		end
	},
	{ "ThePrimeagen/harpoon",     event = "VeryLazy" },
	{ "tpope/vim-fugitive",       cmd = { "Git", "G" } },
	{ "tpope/vim-repeat",         event = "VeryLazy" },
	{ "PHSix/faster.nvim",        lazy = false },
	{ "mcauley-penney/tidy.nvim", event = "BufWritePre",  config = true },
	{ "windwp/nvim-autopairs",    event = "InsertEnter",  config = true },
	{ "kylechui/nvim-surround",   event = "InsertEnter",  config = true },
	{ "danymat/neogen",           cmd = "Neogen",         config = true },
	{ "f-person/git-blame.nvim",  cmd = "GitBlameToggle" },
	{ "nacro90/numb.nvim",        event = "CmdlineEnter", config = true },
	{ "sindrets/diffview.nvim",   cmd = "DiffviewOpen" },
	"nvim-lua/plenary.nvim",
	"onsails/lspkind.nvim",
	-- "jose-elias-alvarez/nvim-lsp-ts-utils",
}
