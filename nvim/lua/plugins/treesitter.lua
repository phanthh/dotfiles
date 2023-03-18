return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
				indent = { enable = true },
				rainbow = {
					enable = true,
					-- query = "rainbow-parens",
					extended_mode = true,
					strategy = require("ts-rainbow.strategy.global"),
				},
				autotag = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = false },
				ensure_installed = {
					"latex",
					"bibtex",
					"markdown",
					"c",
					"cpp",
					"graphql",
					"rust",
					"javascript",
					"typescript",
					"tsx",
					"css",
					"scss",
					"html",
					"lua",
					"python",
					"r",
					"scala",
					"vim",
					"http",
					"bash",
					"toml",
					"json",
					"prisma",
					"sql",
				},
			})
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",
			"HiPhish/nvim-ts-rainbow2",
		},
	},
}
