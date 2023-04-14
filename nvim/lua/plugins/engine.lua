local km = require("utils").keymap
local kmb = require("utils").keymap_buf
return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = {
							-- "lua_ls",
							-- "tsserver",
							-- "pyright",
							-- "cssls",
							-- "bashls",
							-- "clangd",
							-- "rust_analyzer",
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
						kmb(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action)
						kmb(bufnr, "n", "gr", vim.lsp.buf.references)
						kmb(bufnr, "n", "<leader>f", function()
							vim.lsp.buf.format({ async = false })
						end)

						kmb(bufnr, { "v", "n" }, "gf", require("actions-preview").code_actions)
					end

					local handlers = {
						["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
						["textDocument/signatureHelp"] = vim.lsp.with(
							vim.lsp.handlers.signature_help,
							{ border = "rounded" }
						),
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
										kmb(bufnr, "n", "gi", ts.actions.addMissingImports)
										kmb(bufnr, "n", "<leader>rf", "<cmd>TypescriptRenameFile<cr>")
										kmb(bufnr, "n", "gd", "<cmd>TypescriptGoToSourceDefinition<cr>")
									end,
									capabilities = capabilities,
									handlers = handlers,
								},
							})
						end,
					})
				end,
			},
			{
				"jay-babu/mason-null-ls.nvim",
				config = function()
					local nls = require("null-ls")

					require("mason-null-ls").setup({
						ensure_installed = {
							"stylua",
							"prettierd",
							"black",
							"shfmt",
							"clang_format",
							"rustfmt",
						},
					})

					require("null-ls").setup({
						sources = {
							nls.builtins.formatting.stylua,
							nls.builtins.formatting.prettierd,
							nls.builtins.formatting.black,
							nls.builtins.formatting.shfmt,
							nls.builtins.formatting.clang_format,
							require("typescript.extensions.null-ls.code-actions"),
						},
					})
				end,
			},
			{
				"jayp0521/mason-nvim-dap.nvim",
				config = function()
					local dap = require("dap")

					require("mason-nvim-dap").setup({
						ensure_installed = {
							"python",
						},
					})

					dap.adapters.python = {
						type = "executable",
						command = "debugpy-adapter",
					}

					dap.configurations.python = {
						{
							type = "python",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							pythonPath = "python",
						},
					}
				end,
			},
		},
	},
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("dapui").setup()
				end,
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("configs.nvim-luasnip")
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"echasnovski/mini.comment",
		keys = { { "gcc", mode = "n" }, { "gc", mode = "v" } },
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "x", "o" } },
			{ "i", mode = { "x", "o" } },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},

	{
		"hkupty/iron.nvim",
		cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
		config = function()
			local iron = require("iron.core")
			iron.setup({
				config = {
					scratch_repl = true,
					repl_definition = {
						python = {
							command = { "ipython", "--no-autoindent" },
						},
					},
					repl_open_cmd = require("iron.view").split("33%"),
				},
				keymaps = {
					send_motion = "<leader>sc",
					visual_send = "<leader>sc",
					send_file = "<leader>sf",
					send_line = "<leader>sl",
					send_mark = "<leader>sm",
					mark_motion = "<leader>mc",
					mark_visual = "<leader>mc",
					remove_mark = "<leader>md",
					cr = "<leader>s<cr>",
					interrupt = "<leader>s<leader>",
					exit = "<leader>sq",
					clear = "<leader>cl",
				},
				highlight = {
					italic = false,
				},
				ignore_blank_lines = true,
			})

			km(
				"n",
				"<leader>sp",
				"vipj<cmd>lua local iron = require('iron.core') iron.mark_visual() iron.send_mark()<cr>"
			)
		end,
	},

	"aznhe21/actions-preview.nvim",
	"jose-elias-alvarez/typescript.nvim",
}
