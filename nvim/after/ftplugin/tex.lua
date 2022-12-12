require("utils").write_spec()
local km = require("utils").keymap
vim.opt_local.textwidth = 80
vim.opt_local.colorcolumn = 80
vim.opt_local.wrapmargin = 0
vim.opt_local.formatoptions = vim.opt_local.formatoptions .. "t"
vim.opt_local.foldlevel = 99
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
vim.opt_local.foldtext = "vimtex#fold#text()"
km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto Compile enabled!'<cr>")
km("", "<s-f10>", "<cmd>let b:pdfcompile=0<bar>echo 'Auto Compile disabled!'<cr>")
