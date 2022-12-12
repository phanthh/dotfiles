require("cmp_dictionary").setup({
	dic = {
		["*"] = "/usr/share/dict/web2",
	},
	exact = 2,
	async = false,
	capacity = 5,
	debug = false,
})

vim.cmd([[CmpDictionaryUpdate]])
