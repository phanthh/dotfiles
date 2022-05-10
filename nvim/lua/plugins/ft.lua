local km = require("utils").keymap
local concat = require("utils").concat
local opts = { noremap = true, silent = true }

local repl_spec = function(cmd)
	vim.g.sendtowindow_use_default = 0
	km("n", "<c-x>", "V<Plug>SendDownV", { silent = true })
	km("n", "<c-x>", "vip<Plug>SendDownV", { silent = true })
	km("", "<s-f9>", string.format("<cmd>vsplit term://%s<bar>wincmd h<cr>", cmd), opts)
	km("", "<f9>", string.format("<cmd>split term://%s<bar>wincmd k<cr>", cmd), opts)
end

local exts_ft = {
	["py"] = "python",
	["rs"] = "rust",
	["js"] = "javascript",
	["jsx"] = "javascriptreact",
	["ts"] = "typescript",
	["tsx"] = "typescriptreact",
	["md"] = "markdown",
	["m"] = "matlab",
}

local spec_ft = function(base, conf)
	local ret = {}
	for k, v in pairs(conf) do
		local ext = (type(k) == "string") and k or v
		local ft = exts_ft[ext] and exts_ft[ext] or ext
		ret[ext] = function()
			vim.bo.filetype = ft
			base()
			if type(v) == "function" then
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
			[".config/sway/config"] = "sh",
			[".config/task/taskrc"] = "sh",
			[".config/tmux/tmux.conf"] = "tmux",
			[".config/swhkd/*"] = "swhkd",
			[".config/waybar/config"] = "json",
			["fstab"] = "fstab",
			["sudoers"] = "sudoers",
		},
		function_extensions = concat(
			spec_ft(function()
				vim.o.spell = false
				vim.o.ruler = true
				vim.o.showcmd = true
				vim.o.number = true
			end, {
				["r"] = function()
					repl_spec("R")
				end,
				["m"] = function()
					repl_spec("octave")
				end,
				["py"] = function()
					vim.o.spell = true
					repl_spec("micromamba activate && prime-run ipython")
					km("n", "<c-x>", "<cmd>w<cr><Plug>JupyterExecute", { silent = false })
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
				vim.o.spell = true
				vim.o.ruler = false
				vim.o.showcmd = false
				vim.o.number = false
				km("", "<f12>", "<cmd>GrammarousCheck<cr>", opts)
				km("", "<s-f12>", "<cmd>GrammarousReset<cr>", opts)
				km("n", "K", "<cmd>lua require('nabla').popup()<cr>", opts)
			end, {
				["tex"] = function()
					vim.o.foldlevel = 99
					vim.o.foldmethod = "expr"
					vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
					vim.o.foldtext = "vimtex#fold#text()"
					km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto compile enabled!'<cr>", opts)
					km("", "<s-f10>", "<cmd>let b:pdfcompile=0<bar>echo 'Auto compile disabled!'<cr>", opts)
				end,
				["md"] = function()
					km("n", "<leader>z", ":Telekasten panel<cr>", opts)
					km("n", "<leader>zf", ":Telekasten find_notes<cr>", opts)
					km("n", "<leader>zg", ":Telekasten search_notes<cr>", opts)
					km("n", "<leader>zp", ":Telekasten paste_img_and_link<cr>", opts)
					km("i", "<c-l>", "<esc><cmd>:Telekasten insert_link<cr>", { silent = true })
					km("n", "<Tab>", "<esc><cmd>:Telekasten follow_link<cr>", { silent = true })
				end,
				["rmd"] = function()
					repl_spec("R")
					km("", "<f10>", "<cmd>let b:pdfcompile=1<bar>echo 'Auto compile enabled!'<cr>", opts)
					km("", "<s-f10>", "<cmd>let b:pdfcompile=0<bar>echo 'Auto compile disabled!'<cr>", opts)
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
