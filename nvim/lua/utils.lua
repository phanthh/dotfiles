-- Utils functions
local M = {}
function M.iconcat(t1, t2)
	for n = 1, #t2 do
		t1[#t1 + 1] = t2[n]
	end
	return t1
end

function M.concat(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end

-- local mapper = require("nvim-mapper")
--
function M.keymap(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
	-- mapper.map(mode, key, cmd, opts, class, name, desc)
end

function M.keymap_buf(bufnr, mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, buffer = bufnr })
	-- mapper.map_buf(bufnr, mode, key, cmd, opts, class, name, desc)
end

function M.printt(t)
	for k, v in pairs(t) do
		print(k, v)
	end
end

M.coding_ft = {
	"r",
	"python",
	"rs",
	"scala",
	"lua",
	"cpp",
	"c",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"css",
	"scss",
	"html",
	"dart",
	"sh",
}

M.config_ft = {
	"dosini",
	"toml",
	"yaml",
	"json",
	"cfg",
}

M.writing_ft = {
	"tex",
	"markdown",
	"rmd",
}

function M.write_spec()
	vim.opt_local.spell = true
	vim.opt_local.ruler = false
	vim.opt_local.showcmd = false
	vim.opt_local.number = false
	M.keymap("", "<f12>", "<cmd>GrammarousCheck<cr>")
	M.keymap("", "<s-f12>", "<cmd>GrammarousReset<cr>")
	M.keymap("", "<leader>r", "<cmd>FSToggle<cr>")
	-- M.keymap("n", "K", "<cmd>lua require('nabla').popup()<cr>")
end

return M
