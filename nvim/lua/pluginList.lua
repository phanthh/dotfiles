local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup({
	function(use)
		local u = require("utils")

		use("wbthomason/packer.nvim") -- manager

		use({
			"Mofiqul/vscode.nvim", -- vscode theme
			config = function()
				require("configs.vscode")
				vim.cmd([[colorscheme vscode]])
			end,
		})

		use({
			"neovim/nvim-lspconfig", -- lsp helper
			module = "lspconfig",
		})

		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			module = "lsp_lines",
		})

		use({
			"j-hui/fidget.nvim", -- lsp progress indicator
			after = "nvim-lspconfig",
			config = function()
				require("fidget").setup({})
			end,
		})

		use({
			"L3MON4D3/LuaSnip", -- snippets engine
			module = "luasnip",
			requires = {
				{ "rafamadriz/friendly-snippets" }, -- snippets library
			},
		})

		use({ "onsails/lspkind.nvim", module = "lspkind" }) -- nvim-cmp icons

		use({
			"jose-elias-alvarez/null-ls.nvim", -- non-lsp programs hooker
			module = "null-ls",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		use({
			"f-person/git-blame.nvim",
			config = function()
				vim.g.gitblame_enabled = 0
			end,
		})

		-- lazy loading
		local signal = { "InsertEnter", "BufWritePre" }
		local trigger = { "g", "K", "[", "]", "<c-k>", "<leader>" }
		use({
			"hrsh7th/nvim-cmp", -- autocompletion engine
			event = signal,
			keys = trigger,
			module = "cmp",
			config = function()
				require("configs.luasnip")
				require("configs.nvim-lspconfig")
				require("configs.null-ls")
				require("configs.nvim-cmp")
				-- require("configs.lsp_lines")
				vim.cmd([[LspStart]])
			end,
			requires = {
				{ "saadparwaiz1/cmp_luasnip", event = signal, keys = trigger }, -- luasnip source
				{ "hrsh7th/cmp-path", event = signal, keys = trigger }, -- path source
				{ "hrsh7th/cmp-cmdline", event = signal, keys = trigger }, -- cmdline source
				{
					"uga-rosa/cmp-dictionary", -- dictionary source
					event = signal,
					keys = trigger,
					config = function()
						require("configs.cmp-dictionary")
					end,
				},
				{
					"hrsh7th/cmp-nvim-lsp", -- lsp source
					module = "cmp_nvim_lsp",
					event = signal,
					keys = trigger,
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
				require("configs.nvim-treesitter")
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
				{
					"m-demare/hlargs.nvim", -- highlights arguments
					config = function()
						require("hlargs").setup({})
					end,
				},
			},
		})

		use({
			"rhysd/vim-grammarous", -- grammar cheker
			cmd = { "GrammarousCheck", "GrammarousReset" },
			config = function()
				require("configs.vim-grammarous")
			end,
		})

		use({
			"renerocksai/telekasten.nvim", -- zettelkasten
			cmd = "Telekasten",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
			config = function()
				require("configs.telekasten")
			end,
		})

		use({
			"akinsho/bufferline.nvim", -- tab line
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.bufferline")
			end,
		})

		use({
			"nvim-lualine/lualine.nvim", -- status line
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("configs.lualine")
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

		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

		use({
			"nvim-telescope/telescope.nvim", -- telescope
			cmd = "Telescope",
			module = "telescope",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.telescope")
			end,
		})

		use({
			"kyazdani42/nvim-tree.lua", -- file tree
			cmd = { "NvimTreeToggle" },
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("configs.nvim-tree")
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
			"numToStr/Comment.nvim", -- comment helper
			keys = "gc",
			config = function()
				require("configs.Comment")
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim", -- vertical lines
			ft = u.coding_ft,
			requires = "nvim-treesitter/nvim-treesitter",
		})

		use({
			"nathom/filetype.nvim", -- filetype.lua
			config = function()
				require("configs.ft")
			end,
		})

		use({
			"NvChad/nvim-colorizer.lua", -- coloring color codes
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

		-- use({
		-- 	"ThePrimeagen/git-worktree.nvim",
		-- 	module = { "git-worktree", "telescope" },
		-- 	config = function()
		-- 		require("git-worktree").setup({
		-- 			update_on_change = false,
		-- 		})
		-- 	end,
		-- })

		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

		use({
			"mcauley-penney/tidy.nvim", -- clean whitespace
			config = function()
				require("tidy").setup()
			end,
		})

		use({
			"sunjon/shade.nvim", -- shading unfocused windows
			config = function()
				require("shade").setup({
					overlay_opacity = 55,
				})
			end,
			event = "WinLeave",
		})

		use({
			"hkupty/iron.nvim",
			config = function()
				require("configs.iron")
			end,
			cmd = "IronRepl",
		})

		use({
			"NTBBloodbath/rest.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			ft = { "http" },
			config = function()
				require("rest-nvim").setup({
					result_split_horizontal = true,
				})
			end,
		})

		-- use({
		-- 	"petertriho/nvim-scrollbar",
		-- 	config = function()
		-- 		require("scrollbar").setup()
		-- 	end,
		-- })
		--
		use({
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup({})
			end,
		})

		use({
			"wfxr/minimap.vim",
			cmd = "MinimapToggle",
			config = function()
				require("configs.minimap")
			end,
		})

		use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" }) -- profiling startup time
		use({ "tpope/vim-fugitive", cmd = { "Git", "G" } }) -- git
		-- use({ "karoliskoncevicius/vim-sendtowindow", event = "TermOpen" }) -- for repl
		use({ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } }) -- better bufdel
		use({ "jbyuki/nabla.nvim", module = "nabla" }) -- show math as ascii
		-- use({ "untitled-ai/jupyter_ascending.vim", ft = "python" }) -- send to jupyter notebook
		use("lewis6991/impatient.nvim") -- faster loading with caching

		-- use("ActivityWatch/aw-watcher-vim")
		-- use("spywhere/tmux.nvim")
		-- use("kovetskiy/sxhkd-vim")
		-- use("waycrate/swhkd-vim")
		-- use("junegunn/vim-easy-align")
		-- use("jxnblk/vim-mdx-js")
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
