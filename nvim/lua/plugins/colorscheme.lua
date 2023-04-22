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
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
