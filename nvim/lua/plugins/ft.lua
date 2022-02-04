local km = require("utils").keymap
local opts = { noremap = true, silent = true }

local coding_spec = function()
	vim.bo.number = false
	vim.bo.dictionary = ""
end

local repl_spec = function()
	vim.g.sendtowindow_use_default = 0
	km("n", "<leader><leader>", "<Plug>SendDown", opts)
end

local writing_spec = function()
	vim.bo.ruler = false
	vim.bo.showcmd = false
	vim.bo.number = false
	km("", "<f12>", "<cmd>GrammarousCheck<cr>", opts)
	km("", "<s-f12>", "<cmd>GrammarousReset<cr>", opts)
end

require("filetype").setup({
	overrides = {
		extensions = { pn = "potion" },
		complex = {
			[".config/sway/config"] = "i3config",
			[".config/zsh/*"] = "zsh",
		},

		function_extensions = {
			["r"] = function()
				coding_spec()
				repl_spec()
				km("", "<s-f9>", "<cmd>vsplit term://R<bar><cmd>wincmd h<cr>", opts)
				km("", "<f9>", "<cmd>split term://R<bar><cmd>wincmd h<cr>", opts)
			end,
			["py"] = function()
				coding_spec()
				repl_spec()
				km("", "<s-f9>", "<cmd>vsplit term://prime-run ipython<bar><cmd>wincmd h<cr>", opts)
				km("", "<f9>", "<cmd>split term://prime-run ipython<bar><cmd>wincmd h<cr>", opts)
				km("", "<s-f10>", "<cmd>!jupytext --to notebook %<cr><cr>", opts)
				km("n", "<c-x>", "<Plug>JupyterExecute", opts)
			end,
			["rs"] = function()
				coding_spec()
				km("", "<s-f10>", "<cmd>!cargo run<cr>", opts)
			end,
			["scala"] = function()
				coding_spec()
				km("", "<s-f10>", "<cmd>!sbt run<cr>", opts)
				km("", "<f9>", "<cmd>!sbt test<cr>", opts)
			end,
			["tex"] = function()
				writing_spec()
				vim.bo.foldlevel = 99
				vim.bo.foldmethod = "expr"
				vim.bo.foldexpr = "vimtex#fold#level(v:lnum)"
				vim.bo.foldtext = "vimtex#fold#text()"
				km("", "<f10>", "<cmd>VimtexCompile<cr>", opts)
			end,
			["md"] = function()
				writing_spec()
				km("n", "<leader>zf", ":Telekasten find_notes<cr>", opts)
				km("n", "<leader>zl", ":Telekasten insert_link<cr>", opts)
				km("n", "<leader>zd", ":Telekasten find_daily_notes<cr>", opts)
				km("n", "<leader>zg", ":Telekasten search_notes<cr>", opts)
				km("n", "<leader>zz", ":Telekasten follow_link<cr>", opts)
				km("n", "<leader>zi", ":Telekasten paste_img_and_link<cr>", opts)
				km("n", "<leader>z", ":Telekasten panel<cr>", opts)
			end,
			["rmd"] = function()
				writing_spec()
				repl_spec()
				km("", "<s-f9>", "<cmd>vsplit term://R<bar><cmd>wincmd h<cr>", opts)
				km("", "<f9>", "<cmd>split term://R<bar><cmd>wincmd h<cr>", opts)
				km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto compile Rmd enabled!'<cr>", opts)
			end,
		},
		-- function_literal = {
		-- 	Brewfile = function()
		-- 		vim.cmd("syntax off")
		-- 	end,
		-- },
		-- function_complex = {
		-- 	["*.math_notes/%w+"] = function()
		-- 		vim.cmd("iabbrev $ $$")
		-- 	end,
		-- },

		-- shebang = {
		-- 	-- Set the filetype of files with a dash shebang to sh
		-- 	dash = "sh",
		-- },
	},
})
