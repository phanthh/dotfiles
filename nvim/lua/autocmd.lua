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
	pattern = { "*.rmd", "*.tex" },
	callback = function()
		if vim.b.pdfcompile == 1 then
			if vim.bo.filetype == "rmd" then
				vim.fn.jobstart(
					string.format(
						[[rm compile.log; Rscript -e "library(rmarkdown); rmarkdown::render('%s', 'pdf_document')" > compile.log 2>&1]],
						vim.fn.expand("%:p")
					)
				)
			elseif vim.bo.filetype == "tex" then
				vim.fn.jobstart(string.format("pdflatex %s > compile.log 2>&1", vim.fn.expand("%:p")))
			end
		end
	end,
})

-- format on write
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "global",
	pattern = "*",
	callback = function()
		vim.lsp.buf.formatting()
	end,
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
