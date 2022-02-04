require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	ensure_installed = {
		"bibtex",
		"c",
		"cpp",
		"css",
		"html",
		"javascript",
		"latex",
		"lua",
		"markdown",
		"python",
		"r",
		"rust",
		"scala",
		"tsx",
		"vim",
	},
	context_commentstring = { enable = true },
	autotag = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.used_by = "rmd"

vim.cmd([[
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
