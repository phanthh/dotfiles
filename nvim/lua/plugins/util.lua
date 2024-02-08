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
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},

	{ "ThePrimeagen/harpoon",     event = "VeryLazy" },
	{ "tpope/vim-fugitive",       cmd = { "Git", "G" } },
	{ "tpope/vim-repeat",         event = "VeryLazy" },
	{ "PHSix/faster.nvim",        lazy = false },
	{ "mcauley-penney/tidy.nvim", event = "BufWritePre", config = true },
	{
		"ggandor/leap.nvim",
		lazy = false,
		dependencies = { "tpope/vim-repeat" },
	},
	{ "windwp/nvim-autopairs",              event = "InsertEnter",  config = true },
	{ "kylechui/nvim-surround",             event = "InsertEnter",  config = true },
	{ "danymat/neogen",                     cmd = "Neogen",         config = true },
	{ "chrisgrieser/nvim-early-retirement", config = true,          event = "VeryLazy" },
	{ "f-person/git-blame.nvim",            cmd = "GitBlameToggle" },
	{ "nacro90/numb.nvim",                  event = "CmdlineEnter", config = true },
	{ "opdavies/toggle-checkbox.nvim" },
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					merge_tool = {
						-- Config for conflicted files in diff views during a merge or rebase.
						layout = "diff3_mixed",
						disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
						winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
					},
				},
			})
		end,
	},
	"nvim-lua/plenary.nvim",
	"onsails/lspkind.nvim",
	{ "mechatroner/rainbow_csv", ft = { "csv" } },
	-- "jose-elias-alvarez/nvim-lsp-ts-utils",
	-- {
	-- 	"David-Kunz/gen.nvim",
	-- 	cmd = "Gen",
	-- 	config = function()
	-- 		require("gen").model = "codellama:13b"
	-- 		require("gen").prompts["Doc"] = {
	-- 			prompt = "Generate the doc string for the following piece of code. Keep the code as is:\n$text",
	-- 			replace = true,
	-- 		}
	-- 	end,
	-- },

	-- AI stuffs
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
	-- 	config = function()
	-- 		require("chatgpt").setup({
	-- 			keymaps = {
	-- 				submit = "<C-x>",
	-- 				close = { "<C-c>" },
	-- 				yank_last = "<C-y>",
	-- 				yank_last_code = "<C-k>",
	-- 				scroll_up = "<C-u>",
	-- 				scroll_down = "<C-d>",
	-- 				toggle_settings = "<C-o>",
	-- 				new_session = "<C-n>",
	-- 				cycle_windows = "<Tab>",
	-- 				-- in the Sessions pane
	-- 				select_session = "<Space>",
	-- 				rename_session = "r",
	-- 				delete_session = "d",
	-- 			},
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },
	-- {
	-- 	"dpayne/CodeGPT.nvim",
	-- 	cmd = "Chat",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("codegpt.config")
	-- 	end,
	-- },
}
