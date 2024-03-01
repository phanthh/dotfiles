local km = require("utils").keymap
local kmb = require("utils").keymap_buf
return {
	-- mason
	"williamboman/mason-lspconfig.nvim",
	"jay-babu/mason-null-ls.nvim",
	"williamboman/mason.nvim",
	"jayp0521/mason-nvim-dap.nvim",

	-- vim-dadbod
	{ "tpope/vim-dadbod", event = "VeryLazy" },
	{
		"kristijanhusak/vim-dadbod-ui",
		ft = { "sql", "mysql", "plsql" },
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_winwidth = 30
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*", "information_schema" }
			vim.g.db_ui_use_nvim_notify = 1
		end,
	},
	{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },

	---
	"neovim/nvim-lspconfig",
	"nvimtools/none-ls.nvim",
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("dapui").setup()
				end,
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("configs.nvim-luasnip")
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"echasnovski/mini.comment",
		version = "*",
		keys = { { "gcc", mode = "n" }, { "gc", mode = "v" } },
		config = function()
			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring()
							or vim.bo.commentstring
					end,
				},
				mappings = {
					comment = "gc",
					comment_line = "gcc",
					textobject = "gc",
				},
			})
		end,
	},

	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "x", "o" } },
			{ "i", mode = { "x", "o" } },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},

	{
		"hkupty/iron.nvim",
		cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
		config = function()
			local iron = require("iron.core")
			iron.setup({
				config = {
					scratch_repl = true,
					repl_definition = {
						python = {
							command = { "ipython", "--no-autoindent" },
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
					interrupt = "<leader>s<leader>",
					exit = "<leader>sq",
					clear = "<leader>cl",
				},
				highlight = {
					italic = false,
				},
				ignore_blank_lines = true,
			})

			km(
				"n",
				"<leader>sp",
				"vipj<cmd>lua local iron = require('iron.core') iron.mark_visual() iron.send_mark()<cr>"
			)
		end,
	},
	"aznhe21/actions-preview.nvim",
	"jose-elias-alvarez/typescript.nvim",
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- },
	"vim-scripts/dbext.vim",
}
