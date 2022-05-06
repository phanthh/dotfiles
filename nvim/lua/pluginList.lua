require("packer").startup({
	function(use)
		local u = require("utils")

		use("wbthomason/packer.nvim") -- plugins manager

		use({
			"Mofiqul/vscode.nvim", -- vscode theme
			config = function()
				require("plugins.vscode.config")
				vim.cmd([[colorscheme vscode]])
			end,
		})

		use({
			"neovim/nvim-lspconfig", -- lsp helper
			module = "lspconfig",
		})

		use({
			"L3MON4D3/LuaSnip", -- snippets engine
			module = "luasnip",
			config = function()
				require("plugins.luasnip")
			end,
			requires = {
				{ "rafamadriz/friendly-snippets" }, -- snippets library
			},
		})

		local signal = { "InsertEnter" }
		local trigger = { "g", "K", "[", "]", "<c-k>", "<leader>" }
		use({
			"hrsh7th/nvim-cmp", -- autocompletion engine
			module = "cmp",
			keys = trigger,
			config = function()
				require("plugins.nvim-cmp")
				vim.cmd([[LspStart]])
			end,
			requires = {
				{ "saadparwaiz1/cmp_luasnip", event = signal }, -- luasnip source
				{ "hrsh7th/cmp-buffer", event = signal }, -- buffer source
				{ "hrsh7th/cmp-path", event = signal }, -- path source
				{ "hrsh7th/cmp-cmdline", event = signal }, -- cmdline source
				{
					"uga-rosa/cmp-dictionary", -- dictionary source
					event = signal,
					config = function()
						require("plugins.cmp-dictionary")
					end,
				},
				{
					"hrsh7th/cmp-nvim-lsp", -- lsp source
					event = signal,
					requires = {
						{
							"jose-elias-alvarez/nvim-lsp-ts-utils",
							module = "nvim-lsp-ts-utils",
						},
					},
				},
			},
		})

		use({
			"nvim-treesitter/nvim-treesitter", -- treesitter engine
			run = ":TSUpdate",
			config = function()
				require("plugins.nvim-treesitter")
			end,
			requires = {
				"windwp/nvim-ts-autotag", -- autoclose and auto rename html tags
				"JoosepAlviste/nvim-ts-context-commentstring", -- dynamic commentstring
				"p00f/nvim-ts-rainbow", -- rainbow brackets
				{
					"lewis6991/spellsitter.nvim", -- dynamic spellcheck
					config = function()
						require("spellsitter").setup()
					end,
				},
			},
		})

		use({
			"lervag/vimtex", -- latex support
			cmd = "VimtexCompile",
			config = function()
				require("plugins.vimtex")
			end,
		})

		use({
			"rhysd/vim-grammarous", -- grammar checking
			cmd = { "GrammarousCheck", "GrammarousReset" },
			config = function()
				require("plugins.vim-grammarous")
			end,
		})

		use({
			"renerocksai/telekasten.nvim", -- zettelkasten
			cmd = "Telekasten",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
			config = function()
				require("plugins.telekasten")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim", -- status line
			requires = { "kyazdani42/nvim-web-devicons" },
			ft = u.config_ft,
			config = function()
				require("lualine").setup({
					options = {
						theme = "vscode",
						component_separators = { left = " ", right = " " },
						section_separators = { left = " ", right = " " },
					},
				})
			end,
		})

		use({
			"danymat/neogen", -- documentation generator
			cmd = "Neogen",
			config = function()
				require("neogen").setup({ enabled = true })
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		})

		use({
			"nacro90/numb.nvim", -- peaking line
			event = "CmdlineEnter",
			config = function()
				require("numb").setup()
			end,
		})

		use({
			"nvim-telescope/telescope.nvim", -- telescope
			cmd = "Telescope",
			module = "telescope",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
		})

		use({
			"kyazdani42/nvim-tree.lua", -- file tree
			cmd = { "NvimTreeToggle" },
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("plugins.nvim-tree")
			end,
		})

		use({
			"windwp/nvim-autopairs", -- pair brackets
			keys = { { "i", "(" }, { "i", "{" }, { "i", "[" } },
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		use({
			"ur4ltz/surround.nvim", -- easy surround
			event = "InsertEnter",
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})

		use({
			"mhartington/formatter.nvim", -- formatter
			event = "BufWritePre",
			config = function()
				require("plugins.formatter")
			end,
		})

		use({
			"numToStr/Comment.nvim", -- comment helper
			keys = "gc",
			config = function()
				require("Comment").setup()
			end,
		})

		use({ "dstein64/vim-startuptime", cmd = "StartupTime" }) -- profiling startup time
		use({ "tpope/vim-fugitive", cmd = { "Git", "G" } }) -- git
		use({ "karoliskoncevicius/vim-sendtowindow", event = "TermOpen" }) -- for repl

		use({
			"lukas-reineke/indent-blankline.nvim", -- vertical lines
			ft = u.coding_ft,
			requires = "nvim-treesitter/nvim-treesitter",
		})

		use({
			"nathom/filetype.nvim", -- filetype.lua
			config = function()
				require("plugins.ft")
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua", -- coloring color codes
			ft = u.iconcat(u.config_ft, u.coding_ft),
			config = function()
				require("colorizer").setup()
			end,
		})

		use({
			"PHSix/faster.nvim", -- faster jk
			event = "VimEnter *",
			config = function()
				local opts = { noremap = false, silent = true }
				vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", opts)
				vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", opts)
			end,
		})

		use({
			"phaazon/hop.nvim", -- easymotion
			cmd = "HopWord",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovqpdygflzhckisuran" })
			end,
		})

		use({
			"lewis6991/gitsigns.nvim", -- git mark
			ft = u.coding_ft,
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("gitsigns").setup()
			end,
		})

		use({ "McAuleyPenney/tidy.nvim", event = "BufWritePre" }) -- clean whitespace
		use({ "jbyuki/nabla.nvim", module = "nabla" }) -- show math as ascii
		use({ "untitled-ai/jupyter_ascending.vim", ft = "python" }) -- send to jupyter notebook
		use("lewis6991/impatient.nvim") -- faster loading plugins with caching
		-- use({
		-- 	"sunjon/shade.nvim",
		-- 	config = function()
		-- 		require("shade").setup({
		-- 			overlay_opacity = 55,
		-- 		})
		-- 	end,
		-- 	event = "WinLeave",
		-- })
		-- use({
		-- 	"itchyny/calendar.vim",
		-- 	cmd = "Calendar",
		-- 	config = function()
		-- 		vim.g.calendar_google_calendar = 1
		-- 		vim.g.calendar_google_task = 0
		-- 		vim.g.calendar_google_api_key = os.getenv("CALENDAR_VIM_API_KEY")
		-- 		vim.g.calendar_google_client_id = os.getenv("CALENDAR_VIM_CLIENT_ID")
		-- 		vim.g.calendar_google_client_secret = os.getenv("CALENDAR_VIM_CLIENT_SECRET")
		-- 	end,
		-- })
		-- use("ActivityWatch/aw-watcher-vim")
		-- use("spywhere/tmux.nvim")
		-- use("kovetskiy/sxhkd-vim")
		use("waycrate/swhkd-vim")
		-- use({ "airblade/vim-gitgutter", event = "CmdlineEnter" })
		-- use("junegunn/vim-easy-align")
		-- use 'jxnblk/vim-mdx-js'
	end,
})
