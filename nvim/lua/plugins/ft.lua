local km = require("utils").keymap
local concat = require("utils").concat
local opts = { noremap = true, silent = true }

local coding_spec = function()
	vim.o.number = true
	vim.o.dictionary = ""
end

local repl_spec = function()
	vim.g.sendtowindow_use_default = 0
	km("n", "<leader><leader>", "<Plug>SendDown", opts)
end

local writing_spec = function()
	vim.o.ruler = false
	vim.o.showcmd = false
	vim.o.number = false
	km("", "<f12>", "<cmd>GrammarousCheck<cr>", opts)
	km("", "<s-f12>", "<cmd>GrammarousReset<cr>", opts)
end

local code_exts_ft = {
	["lua"] = "lua",
	["r"] = "r",
	["py"] = "python",
	["rs"] = "rust",
	["scala"] = "scala",
	["cpp"] = "cpp",
	["c"] = "c",
	["js"] = "javascript",
	["jsx"] = "javascriptreact",
	["ts"] = "typescript",
	["tsx"] = "typescriptreact",
	["css"] = "css",
	["scss"] = "scss",
	["html"] = "html",
	["dart"] = "dart",
}
local code_specs = {}
for ext, ft in pairs(code_exts_ft) do
  local spec
	local base_spec = function()
    vim.bo.filetype = ft
    coding_spec()
  end
	if ext == "r" then
		spec = function()
			base_spec()
			repl_spec()
			km("", "<s-f9>", "<cmd>vsplit term://R<bar><cmd>wincmd h<cr>", opts)
			km("", "<f9>", "<cmd>split term://R<bar><cmd>wincmd h<cr>", opts)
		end
	elseif ext == "py" then
		spec = function()
			base_spec()
			repl_spec()
			km("", "<s-f9>", "<cmd>vsplit term://prime-run ipython<bar><cmd>wincmd h<cr>", opts)
			km("", "<f9>", "<cmd>split term://prime-run ipython<bar><cmd>wincmd h<cr>", opts)
			km("", "<s-f10>", "<cmd>!jupytext --to notebook %<cr><cr>", opts)
			km("n", "<c-x>", "<Plug>JupyterExecute", opts)
		end
	elseif ext == "rs" then
		spec = function()
			base_spec()
			km("", "<s-f10>", "<cmd>!cargo run<cr>", opts)
		end
	elseif ext == "scala" then
		spec = function()
			base_spec()
			km("", "<s-f10>", "<cmd>!sbt run<cr>", opts)
			km("", "<f9>", "<cmd>!sbt test<cr>", opts)
		end
  else
    spec = base_spec
	end
	code_specs[ext] = spec
end

require("filetype").setup({
	overrides = {
		-- extensions = { pn = "potion" },
		complex = {
			[".config/sway/config"] = "i3config",
			[".config/zsh/*"] = "zsh",
			[".config/testing/*"] = "markdown",
		},
		function_extensions = concat(code_specs, {
			-- writing
			["tex"] = function()
				writing_spec()
				vim.o.foldlevel = 99
				vim.o.foldmethod = "expr"
				vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
				vim.o.foldtext = "vimtex#fold#text()"
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
		}),
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
