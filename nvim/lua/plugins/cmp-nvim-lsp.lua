-- Language server
local nvim_lsp = require("lspconfig")

-- Keybinds
local on_attach = function(client, bufnr)
	local function km(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function so(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }
	so("omnifunc", "v:lua.vim.lsp.omnifunc")
	km("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	km("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	km("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	km("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	km('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	km("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
	km("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
	km("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
	km("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	km("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	km("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	km("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	km("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)
	km("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
	km("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
	km("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", opts)
	km("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Server list
local servers = {
	"pyright",
	"rust_analyzer",
	"texlab",
	"clangd",
	"vimls",
	"bashls",
	"r_language_server",
	"sumneko_lua",
	"tsserver",
  "dartls",
	-- "tailwindcss"
}

-- Setup
for _, lsp in ipairs(servers) do
	local opts = { on_attach = on_attach, capabilities = capabilities }
	if lsp == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	elseif lsp == "tsserver" then
		opts.init_options = require("nvim-lsp-ts-utils").init_options
		opts.on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			require("plugins.nvim-lsp-ts-utils").config(client, bufnr)
		end
	end
	nvim_lsp[lsp].setup(opts)
end
