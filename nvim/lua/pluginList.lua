require("packer").startup({
	function(use)
		-- colorscheme
		use({
			"Mofiqul/vscode.nvim",
			config = function()
				vim.g.vscode_italic_comment = 1
				-- override colors
				require("vscode.colors").generate = function()
					local colors = require("plugins.vscode.dark").colors
					colors.vscUiBlue = "#084671"
					colors.vscUiOrange = "#f28b25"
					return colors
				end
				vim.cmd([[colorscheme vscode]])
			end,
		})

		-- language server
		use({ "neovim/nvim-lspconfig", event = "InsertEnter" })

		-- snippets
		use({
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			config = function()
				require("plugins.luasnip")
			end,
			requires = {
				"rafamadriz/friendly-snippets",
			},
		})

		-- auto complete
		use({
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			after = "LuaSnip",
			config = function()
				require("plugins.nvim-cmp")
			end,
			requires = {
				{ "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{
					"uga-rosa/cmp-dictionary",
					config = function()
						require("plugins.cmp-dictionary")
					end,
					after = "nvim-cmp",
				},
				{
					"hrsh7th/cmp-nvim-lsp",
					after = { "nvim-cmp", "nvim-lspconfig" },
					config = function()
						require("plugins.cmp-nvim-lsp")
					end,
					requires = {
						{
							"jose-elias-alvarez/nvim-lsp-ts-utils",
							module = "nvim-lsp-ts-utils",
							after = { "nvim-treesitter", "plenary.nvim", "cmp-nvim-lsp" },
						},
					},
				},
				{
					"uga-rosa/cmp-dictionary",
					after = "nvim-cmp",
					config = function()
						require("plugins.cmp-dictionary")
					end,
				},
			},
		})

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.nvim-treesitter")
			end,
			run = ":TSUpdate",
			requires = {
				"windwp/nvim-ts-autotag",
				"JoosepAlviste/nvim-ts-context-commentstring",
				"p00f/nvim-ts-rainbow",
				{
					"lewis6991/spellsitter.nvim",
					config = function()
						require("spellsitter").setup()
					end,
				},
			},
		})

		-- writing
		use({
			"lervag/vimtex",
			config = function()
				require("plugins.vimtex")
			end,
			cmd = "VimtexCompile",
		})

		use({
			"rhysd/vim-grammarous",
			config = function()
				require("plugins.vim-grammarous")
			end,
			cmd = { "GrammarousCheck", "GrammarousReset" },
		})

		use({
			"renerocksai/telekasten.nvim",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
			after = "telescope.nvim",
			config = function()
				require("plugins.telekasten")
			end,
		})

		-- utils
		use({
			"danymat/neogen",
			config = function()
				require("neogen").setup({ enabled = true })
			end,
			requires = "nvim-treesitter/nvim-treesitter",
			cmd = "Neogen",
		})

		use({
			"nacro90/numb.nvim",
			event = "CmdlineEnter",
			config = function()
				require("numb").setup()
			end,
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			cmd = {
				"Telekasten",
				"Telescope",
			},
		})

		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			cmd = { "NvimTreeToggle" },
			config = function()
				require("plugins.nvim-tree")
			end,
		})

		use({
			"windwp/nvim-autopairs",
			keys = { { "i", "(" }, { "i", "{" }, { "i", "[" } },
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		use({ "sbdchd/neoformat", cmd = "Neoformat" })
		use({ "tpope/vim-fugitive", cmd = { "Git", "G" } })
		use({ "karoliskoncevicius/vim-sendtowindow", event = "TermOpen" })
		use({ "tpope/vim-surround", keys = "S" })
		use({ "tpope/vim-commentary", keys = "gcc" })

		-- latent
		use({
			"nathom/filetype.nvim",
			config = function()
				require("plugins.ft")
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
			ft = { "css", "scss", "typescriptreact" },
		})

		use({
			"PHSix/faster.nvim",
			event = { "VimEnter *" },
			config = function()
				local opts = { noremap = false, silent = true }
				vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", opts)
				vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", opts)
			end,
		})

		use({
			"phaazon/hop.nvim",
			cmd = "HopWord",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovqpdygflzhckisuran" })
			end,
		})

		use("untitled-ai/jupyter_ascending.vim")
		use("ActivityWatch/aw-watcher-vim")
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim")
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- use("airblade/vim-gitgutter")
		-- use("junegunn/vim-easy-align")
		-- use 'jxnblk/vim-mdx-js'
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
