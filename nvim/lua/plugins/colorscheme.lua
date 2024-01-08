return {
	{
		"ellisonleao/gruvbox.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"cranberry-clockworks/coal.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function()
			vim.cmd([[colorscheme coal]])
			vim.o.cursorline = true
			vim.o.cursorcolumn = true
		end,
	},
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = true,
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
				overrides = function(colors)
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
					}
				end,
			})
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
