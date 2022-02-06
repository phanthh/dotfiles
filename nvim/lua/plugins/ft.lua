local km = require("utils").keymap
local concat = require("utils").concat
local opts = { noremap = true, silent = true }

local repl_spec = function(cmd)
	vim.g.sendtowindow_use_default = 0
	km("n", "<leader><leader>", "<Plug>SendDown", opts)
	km("", "<s-f9>", string.format("<cmd>vsplit term://%s<bar>wincmd h<cr>", cmd), opts)
	km("", "<f9>", string.format("<cmd>split term://%s<bar>wincmd h<cr>", cmd), opts)
end

local exts_ft = {
	["py"] = "python",
	["rs"] = "rust",
	["js"] = "javascript",
	["jsx"] = "javascriptreact",
	["ts"] = "typescript",
	["tsx"] = "typescriptreact",
	["md"] = "markdown",
}

local spec_ft = function(base, conf)
	local ret = {}
	for k, v in pairs(conf) do
    local ext = (type(k) == "string") and k or v
    local ft = exts_ft[ext] and exts_ft[ext] or ext
		ret[ext] = function()
			vim.bo.filetype = ft
			base()
			if type(v) == 'function' then
				v()
			end
		end
	end
	return ret
end

require("filetype").setup({
	overrides = {
		-- extensions = { pn = "potion" },
		complex = {
			[".config/sway/config"] = "i3config",
			[".config/zsh/*"] = "zsh",
		},
		function_extensions = concat(
			spec_ft(function()
				vim.o.dictionary = ""
				vim.o.number = true
			end, {
				["r"] = function()
					repl_spec("R")
				end,
				["py"] = function()
					repl_spec("prime-run ipython")
					km("n", "<c-x>", "<Plug>JupyterExecute", { silent = false })
					km("", "<s-f10>", "<cmd>!jupytext --to notebook %<cr><cr>", opts)
				end,
				["rs"] = function()
					km("", "<s-f10>", "<cmd>!cargo run<cr>", opts)
				end,
				["scala"] = function()
					repl_spec("scala")
					km("", "<s-f10>", "<cmd>!sbt run<cr>", opts)
					km("", "<f11>", "<cmd>!sbt test<cr>", opts)
				end,
				["lua"] = function()
					vim.o.spell = false
					repl_spec("lua")
				end,
				"cpp",
				"c",
				["js"] = function()
					repl_spec("node")
				end,
				"jsx",
				"ts",
				"tsx",
				"css",
				"scss",
				"html",
				"dart",
			}),
			spec_ft(function()
				vim.o.ruler = false
				vim.o.showcmd = false
				vim.o.number = false
				km("", "<f12>", "<cmd>GrammarousCheck<cr>", opts)
				km("", "<s-f12>", "<cmd>GrammarousReset<cr>", opts)
			end, {
				["tex"] = function()
					vim.o.foldlevel = 99
					vim.o.foldmethod = "expr"
					vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
					vim.o.foldtext = "vimtex#fold#text()"
					km("", "<f10>", "<cmd>VimtexCompile<cr>", opts)
				end,
				["md"] = function()
					km("n", "<leader>zf", ":Telekasten find_notes<cr>", opts)
					km("n", "<leader>zl", ":Telekasten insert_link<cr>", opts)
					km("n", "<leader>zd", ":Telekasten find_daily_notes<cr>", opts)
					km("n", "<leader>zg", ":Telekasten search_notes<cr>", opts)
					km("n", "<leader>zz", ":Telekasten follow_link<cr>", opts)
					km("n", "<leader>zi", ":Telekasten paste_img_and_link<cr>", opts)
					km("n", "<leader>z", ":Telekasten panel<cr>", opts)
				end,
				["rmd"] = function()
					repl_spec()
					km("", "<s-f9>", "<cmd>vsplit term://R<bar><cmd>wincmd h<cr>", opts)
					km("", "<f9>", "<cmd>split term://R<bar><cmd>wincmd h<cr>", opts)
					km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto compile Rmd enabled!'<cr>", opts)
					km("", "<s-f10>", "<cmd>let b:pdfcompile=0<bar>echo 'Auto compile Rmd disabled!'<cr>", opts)
				end,
			})
		),
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
	},
})
