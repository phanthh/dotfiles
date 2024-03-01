local km = require("utils").keymap
local kmb = require("utils").keymap_buf

-- mason-lspconfig
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"cssls",
		"tailwindcss",
		"bashls",
		"clangd",
		"rust_analyzer",
		"tsserver",
		"gopls",
		"ltex",
	},
})

local nvim_lsp = require("lspconfig")

km("n", "<leader>e", vim.diagnostic.open_float)
km("n", "[d", vim.diagnostic.goto_prev)
km("n", "]d", vim.diagnostic.goto_next)
km("n", "<leader>q", vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	kmb(bufnr, "n", "gD", vim.lsp.buf.declaration)
	kmb(bufnr, "n", "gd", vim.lsp.buf.definition)
	kmb(bufnr, "n", "K", vim.lsp.buf.hover)
	kmb(bufnr, "n", "gi", vim.lsp.buf.implementation)
	kmb(bufnr, "n", "<C-k>", vim.lsp.buf.signature_help)
	kmb(bufnr, "n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
	kmb(bufnr, "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
	kmb(bufnr, "n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	kmb(bufnr, "n", "<leader>D", vim.lsp.buf.type_definition)
	kmb(bufnr, "n", "<leader>rn", vim.lsp.buf.rename)
	-- kmb(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action)
	kmb(bufnr, "n", "<leader>ca", require("actions-preview").code_actions)
	kmb(bufnr, "n", "gr", vim.lsp.buf.references)
	kmb(bufnr, "n", "<leader>f", function()
		vim.lsp.buf.format({ async = false })
	end)
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		nvim_lsp[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end,
	["lua_ls"] = function()
		nvim_lsp["lua_ls"].setup({
			on_attach = on_attach,
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
	end,
	["tsserver"] = function()
		local ts = require("typescript")
		ts.setup({
			server = {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					kmb(bufnr, "n", "gs", function()
						ts.actions.removeUnused({ sync = true })
						ts.actions.organizeImports({ sync = true })
					end)
					kmb(bufnr, "n", "gi", "<cmd>TypescriptAddMissingImports<cr>")
					kmb(bufnr, "n", "<leader>rf", "<cmd>TypescriptRenameFile<cr>")
					kmb(bufnr, "n", "gd", "<cmd>TypescriptGoToSourceDefinition<cr>")
				end,
				capabilities = capabilities,
				handlers = handlers,
			},
		})
	end,
})

-- require("typescript-tools").setup({
-- 	on_attach = function(client, bufnr)
-- 		on_attach(client, bufnr)
-- 		kmb(bufnr, "n", "gi", "<cmd>TSToolsAddMissingImports<cr>")
-- 		kmb(bufnr, "n", "gs", "<cmd>TSToolsOrganizeImports<cr>")
-- 		kmb(bufnr, "n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>")
-- 		kmb(bufnr, "n", "<leader>rf", "<cmd>TSToolsRenameFile<cr>")
-- 		kmb(bufnr, "n", "gr", "<cmd>TSToolsFileReferences<cr>")
-- 	end,
-- 	capabilities = capabilities,
-- 	handlers = handlers,
-- })
