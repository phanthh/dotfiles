return {
	{
		"akinsho/bufferline.nvim", -- bufferline
		event = "VeryLazy",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-lualine/lualine.nvim", -- status line
		event = "VeryLazy",
		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "diagnostics" },
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = "", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "nvim-tree" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		opts = {
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "glowpreview" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	{
		"echasnovski/mini.indentscope",
		event = "BufReadPre",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason", "glowpreview" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},

	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
			require("utils").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = { separator = " ", highlight = true, depth_limit = 5 },
	},

	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp_lines").setup({})
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = false,
			})
		end,
	},

	{
		"nvim-zh/colorful-winsep.nvim",
		event = "VeryLazy",
		opts = {
			highlight = {
				bg = "#16161E",
				fg = "#d79921",
			},
		},
	},
	{ "j-hui/fidget.nvim", event = "VeryLazy", config = true },
	-- { "kosayoda/nvim-lightbulb", dependencies = "antoinemadec/FixCursorHold.nvim" },
	{
		"gorbit99/codewindow.nvim",
		config = function()
			require("codewindow").setup({
				minimap_width = 10,
				exclude_filetypes = { "NvimTree" },
			})
		end,
	},

	"MunifTanjim/nui.nvim",
}
