local code_actions = require("null-ls").builtins.code_actions
local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
-- local completion = require("null-ls").builtins.completion
require("null-ls").setup({
	sources = {
		formatting.stylua,
		formatting.black,
		formatting.prettier,
		formatting.shfmt,
		diagnostics.proselint,
		code_actions.proselint,
		-- diagnostics.pylint,
	},
})
