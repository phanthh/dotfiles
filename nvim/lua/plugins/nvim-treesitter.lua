require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	ensure_installed = {
		"latex",
		"bibtex",
		"markdown",
		"c",
		"cpp",
		"rust",
		"javascript",
		"typescript",
		"tsx",
		"css",
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
	},
	context_commentstring = { enable = true, enable_autocmd = false },
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

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.markdown.used_by = "rmd"

vim.cmd([[
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
