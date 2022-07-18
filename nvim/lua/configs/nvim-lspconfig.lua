local nvim_lsp = require("lspconfig")
local u = require("utils")

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.uri, "react/index.d.ts") == nil
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	["textDocument/definition"] = function(err, result, method, ...)
		if vim.tbl_islist(result) and #result > 1 then
			local filtered_result = filter(result, filterReactDTS)
			return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
		end

		vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
	end,
}

-- LSP keybinds
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local function km(mode, key, cmd)
		u.keymap_buf(bufnr, mode, key, cmd, opts)
	end
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	km("n", "gD", "<cmd>wa<bar>lua vim.lsp.buf.declaration()<cr>")
	km("n", "gd", "<cmd>wa<bar>lua vim.lsp.buf.definition()<cr>")
	km("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
	km("n", "gi", "<cmd>wa<bar>lua vim.lsp.buf.implementation()<cr>")
	km("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	km("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
	km("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
	km("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
	km("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	km("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
	km("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	km("n", "gr", "<cmd>wa<bar>lua vim.lsp.buf.references()<cr>")
	km("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
	km("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>")
	km("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")
	km("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
	km("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>")
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- bashls
nvim_lsp.bashls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	capabilities = capabilities,
	handlers = handlers,
})

-- pyright
nvim_lsp.pyright.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	capabilities = capabilities,
	handlers = handlers,
})

-- sumneko_lua
nvim_lsp.sumneko_lua.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- tsserver
nvim_lsp.tsserver.setup({
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		require("configs.nvim-lsp-ts-utils").config(client, bufnr)
		client.resolved_capabilities.document_formatting = false
	end,
	capabilities = capabilities,
	handlers = handlers,
})

-- others
local others = {
	"rust_analyzer",
	"texlab",
	"clangd",
	"vimls",
	"r_language_server",
	"dartls",
	-- "tailwindcss",
	"prismals",
	"cssls",
	"ltex",
}

for _, lsp in ipairs(others) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
	})
end
