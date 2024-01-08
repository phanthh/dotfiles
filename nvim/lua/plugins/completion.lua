return {
	{
		"hrsh7th/nvim-cmp", -- autocompletion engine
		keys = { "g", "K", "[", "]", "<leader>" },
		event = { "InsertEnter", "BufWritePre" },
		config = function()
			require("mason").setup({})
			require("configs.mason-lspconfig")
			require("configs.mason-null-ls")
			require("configs.mason-nvim-dap")
			require("codeium").setup({})
			require("configs.nvim-cmp")
			-- require("nvim-lightbulb").setup({
			-- 	autocmd = {
			-- 		enabled = true,
			-- 	},
			-- })
			vim.cmd([[LspStart]])
		end,
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			{
				"uga-rosa/cmp-dictionary",
				config = function()
					require("cmp_dictionary").setup({
						dic = {
							["*"] = "/usr/share/dict/web2",
						},
						exact = 2,
						async = false,
						capacity = 5,
						debug = false,
					})

					-- vim.cmd([[CmpDictionaryUpdate]])
				end,
			},
			{
				"Exafunction/codeium.nvim",
				dependencies = "nvim-lua/plenary.nvim",
			},
			-- {
			-- 	"tzachar/cmp-ai",
			-- 	dependencies = "nvim-lua/plenary.nvim",
			-- 	config = function()
			-- 		local cmp_ai = require("cmp_ai.config")
			--
			-- 		cmp_ai:setup({
			-- 			max_lines = 100,
			-- 			provider = "Ollama",
			-- 			provider_options = {
			-- 				model = "codellama:7b-code",
			-- 			},
			-- 			notify = true,
			-- 			notify_callback = function(msg)
			-- 				vim.notify(msg)
			-- 			end,
			-- 			run_on_every_keystroke = false,
			-- 			ignored_file_types = {
			-- 				-- default is not to ignore
			-- 				-- uncomment to ignore in lua:
			-- 				-- lua = true
			-- 			},
			-- 		})
			-- 	end,
			-- },
		},
	},

	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		vim.keymap.set("i", "<Tab><Tab>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-h>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-l>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-x>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true })
	-- 	end,
	-- },
}
