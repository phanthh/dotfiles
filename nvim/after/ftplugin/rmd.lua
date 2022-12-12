require("utils").write_spec()
local km = require("utils").keymap
km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto compile enabled!'<cr>")
km("", "<s-f10>", "<cmd>let b:pdfcompile=0<bar>echo 'Auto compile disabled!'<cr>")
