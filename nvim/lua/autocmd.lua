-- autocompile packer
vim.api.nvim_create_augroup("global", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "global",
	pattern = "pluginList.lua, ft.lua",
	command = "source <afile> | PackerCompile | LuaCacheClear",
})

-- autocompile rmd
vim.b.pdfcompile = 0
vim.api.nvim_create_autocmd("BufWritePre", {
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
				local filename = vim.fn.expand("%:r")
				vim.fn.jobstart(
					string.format(
						"pdflatex %s.tex > compile.log 2>&1 && bibtex %s.aux && pdflatex %s.tex && pdflatex %s.tex",
						filename,
						filename,
						filename,
						filename
					)
				)
			end
		end
	end,
})

-- format on write
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	group = "global",
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_command("write")
-- 	end,
-- })

-- format on write
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = "global",
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.lsp.buf.formatting()
-- 	end,
-- })

-- term options
vim.api.nvim_create_autocmd("TermOpen", {
	group = "global",
	pattern = "*",
	command = "setlocal nonumber nospell",
})

-- reset waybar
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = "global",
-- 	pattern = "*/waybar/config",
-- 	callback = function()
-- 		io.popen("pkill -SIGUSR2 waybar")
-- 	end,
-- })

-- syntax on
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = "global",
-- 	pattern = "help",
-- 	command = "syntax on",
