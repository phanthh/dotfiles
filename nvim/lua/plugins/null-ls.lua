local u = require("utils")
local code_actions = require("null-ls").builtins.code_actions
local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics

-- local completion = require("null-ls").builtins.completion
require("null-ls").setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		-- formatting.black,
		formatting.autopep8,
		formatting.shfmt,
		diagnostics.proselint.with({ filetypes = u.writing_ft }),
		code_actions.proselint.with({ filetypes = u.writing_ft }),
	},
})
