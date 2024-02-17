local nls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"prettier",
		"black",
		"shfmt",
		"clang_format",
		"rustfmt",
	},
})

require("null-ls").setup({
	sources = {
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.prettier,
		nls.builtins.formatting.black,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.clang_format,
		-- require("typescript.extensions.null-ls.code-actions"),
	},
})
