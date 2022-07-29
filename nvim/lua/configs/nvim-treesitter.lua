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
		"prisma",
	},
	context_commentstring = { enable = true, enable_autocmd = false },
	autotag = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }
		extended_mode = false,
		max_file_lines = nil,
	},
})

vim.cmd([[
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
