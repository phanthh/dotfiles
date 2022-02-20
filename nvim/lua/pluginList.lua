require("packer").startup({
	function(use)
		local coding_ft = require("utils").coding_ft
		local writing_ft = require("utils").writing_ft

		-- colorscheme
		use({
			"Mofiqul/vscode.nvim",
			config = function()
				require("plugins.vscode.config")
				vim.cmd([[colorscheme vscode]])
			end,
		})

		-- language server
		use({
			"neovim/nvim-lspconfig",
			event = "InsertEnter",
		})

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
			module = "cmp",
			config = function()
				require("plugins.nvim-cmp")
			end,
			requires = {
				{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
				{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
				{ "hrsh7th/cmp-path", event = "InsertEnter" },
				{ "hrsh7th/cmp-cmdline", event = "InsertEnter" },
				{
					"uga-rosa/cmp-dictionary",
					event = "InsertEnter",
					config = function()
						require("plugins.cmp-dictionary")
					end,
				},
				{
					"hrsh7th/cmp-nvim-lsp",
					event = "InsertEnter",
					config = function()
						require("plugins.cmp-nvim-lsp")
					end,
					requires = {
						{
							"jose-elias-alvarez/nvim-lsp-ts-utils",
							module = "nvim-lsp-ts-utils",
						},
					},
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
			cmd = "Telekasten",
			config = function()
				require("plugins.telekasten")
			end,
		})

		-- utils
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			ft = coding_ft,
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
			module = "telescope",
			cmd = "Telescope",
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
				require("nvim-autopairs").setup()
			end,
		})

		use({
			"ur4ltz/surround.nvim",
			event = "InsertEnter",
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})

		use({
			"mhartington/formatter.nvim",
			event = { "BufWritePre" },
			config = function()
				require("formatter").setup({
					filetype = {
						lua = {
							function()
								return {
									exe = "stylua",
									args = { "-" },
									stdin = true,
								}
							end,
						},
						python = {
							function()
								return {
									exe = "/usr/bin/black",
									args = { "-" },
									stdin = true,
								}
							end,
						},
					},
				})
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
			keys = "gc",
		})

		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
		use({ "tpope/vim-fugitive", cmd = { "Git", "G" } })
		use({ "karoliskoncevicius/vim-sendtowindow", event = "TermOpen" })

		-- latent
		-- use({
		-- 	"sunjon/shade.nvim",
		-- 	config = function()
		-- 		require("shade").setup({
		-- 			overlay_opacity = 55,
		-- 		})
		-- 	end,
		-- 	event = "WinLeave",
		-- })

		use({
			"lukas-reineke/indent-blankline.nvim",
			requires = "nvim-treesitter/nvim-treesitter",
			ft = coding_ft,
		})

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

		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			ft = coding_ft,
			config = function()
				require("gitsigns").setup()
			end,
		})

		use({ "jbyuki/nabla.nvim", module = "nabla" })
		use({ "McAuleyPenney/tidy.nvim", event = "BufWritePre" })
		use({ "untitled-ai/jupyter_ascending.vim", ft = "python" })
		use("ActivityWatch/aw-watcher-vim")
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim")

		-- use("airblade/vim-gitgutter")
		-- use("junegunn/vim-easy-align")
		-- use 'jxnblk/vim-mdx-js'
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
