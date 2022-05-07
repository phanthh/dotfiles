-- autocompile packer
vim.api.nvim_create_augroup("global", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "global",
	pattern = "pluginList.lua, ft.lua",
	command = "source <afile> | PackerCompile | LuaCacheClear",
})

-- autocompile rmd
vim.b.pdfcompile = 0
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "global",
	pattern = { "*.rmd", "*.Rmd" },
	callback = function()
		if vim.b.pdfcompile == 1 then
			vim.fn.jobstart(string.format("util_rmdcompile %s pdf_document", vim.fn.expand("%:p")))
		end
	end,
})

-- format on write
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "global",
	pattern = "*",
	callback = function()
    vim.lsp.buf.formatting()
  end
})

-- term options
vim.api.nvim_create_autocmd("TermOpen", {
	group = "global",
	pattern = "*",
	command = "setlocal nonumber nospell",
})

-- syntax on
vim.api.nvim_create_autocmd("FileType", {
	group = "global",
	pattern = "help",
	command = "syntax on",
})
