local km = require("utils").keymap
-- local kmx = require("utils").keymap_expr

-------------- NATIVES
-- motions
km("n", "j", "<Plug>(faster_move_gj)")
km("n", "k", "<Plug>(faster_move_gk)")
km("n", "<leader>a", "ggVG")
km("i", "jj", "<esc>")
km("v", "<c-p>", "<cmd>m '<-2<cr>gv=gv")
km("v", "<c-n>", "<cmd>m '>+1<cr>gv=gv")
km("v", "p", '"_dP')
km("i", "<c-c>", "<esc>")
km("i", "<c-f>", "<esc>")
km("n", "\\\\", "<cmd>wqa<cr>")
km("n", "<leader>q", "<cmd>q!<cr>")
km("n", "s", "<Plug>(leap-forward)")
km("n", "S", "<Plug>(leap-backward)")

local clients = {
	"bashls",
	"pyright",
	"lua_ls",
	"tsserver",
	"rust_analyzer",
} -- blacklisted clients

local function format_save_func()
	vim.lsp.buf.format({
		filter = function(client)
			return clients[client.name] == nil
		end,
	})
end

-- saving
km("n", "<c-s>", format_save_func)
km("i", "<c-s>", format_save_func)

-- buffers
km("n", "<c-w>i", "<cmd>bnext<cr>")
km("n", "<c-w>u", "<cmd>bprev<cr>")
-- km("n", "<c-w>c", function()
-- 	require("mini.bufremove").delete(0, false)
-- end)
-- km("n", "<c-w>W", function()
-- 	require("mini.bufremove").delete(0, true)
-- end)
km("n", "<c-w>0", "<cmd>bfirst<cr")
km("n", "<c-w>$", "<cmd>blast<cr>")

-- km({ "n", "t" }, "<c-w>h", "<cmd>NavigatorLeft<cr>")
-- km({ "n", "t" }, "<c-w>l", "<cmd>NavigatorRight<cr>")
-- km({ "n", "t" }, "<c-w>k", "<cmd>NavigatorUp<cr>")
-- km({ "n", "t" }, "<c-w>j", "<cmd>NavigatorDown<cr>")

-------------- PLUGINS

-- telescope
km("n", "<leader>fw", "<cmd>wa<bar>Telescope egrepify<cr>")
km("n", "<leader>fe", "<cmd>wa<bar>Telescope env<cr>")
km("n", "<leader>ff", "<cmd>wa<bar>Telescope find_files hidden=true<cr>")
km("n", "<leader>fg", "<cmd>wa<bar>Telescope git_files<cr>")
km("n", "<leader>fb", "<cmd>wa<bar>Telescope buffers<cr>")
km("n", "<leader>fh", "<cmd>wa<bar>Telescope help_tags<cr>")
km("n", "<leader>fu", "<cmd>wa<bar>Telescope undo<cr>")

-- nvim-tree
km("n", "<c-n>", "<cmd>NvimTreeToggle<cr>")
km("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>")

-- vim dadbod
km("n", "<c-b>", "<cmd>DBUIToggle<cr>")

-- harpoon
km("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>")
km("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

for i = 1, 9 do
	km("n", "<leader>" .. i, string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<cr>", i))
end

-- git
km("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
km("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
km("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>")
km("n", "<leader>gX", "<cmd>Gitsigns reset_buffer<cr>")
km("n", "<leader>gf", "<cmd>DiffviewOpen<cr>")
km("n", "<leader>gF", "<cmd>DiffviewClose<cr>")
km("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>")
km({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
km({ "n", "v" }, "<leader>gx", "<cmd>Gitsigns reset_hunk<cr>")
km({ "n", "v" }, "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>")
km({ "n", "v" }, "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")

-- minimap
km("n", "<leader>m", "<cmd>lua require('codewindow').toggle_minimap()<cr>")

-- repl
km("n", "<leader>rs", "<cmd>IronRepl<cr>")
km("n", "<leader>rr", "<cmd>IronRestart<cr>")
km("n", "<leader>rf", "<cmd>IronFocus<cr>")
km("n", "<leader>rh", "<cmd>IronHide<cr>")

-- telekasten
-- km("n", "<leader>z", "<cmd>Telekasten panel<cr>")
-- km("n", "<leader>zf", "<cmd>Telekasten find_notes<cr>")
-- km("n", "<leader>zg", "<cmd>Telekasten search_notes<cr>")
-- km("n", "<leader>zp", "<cmd>Telekasten paste_img_and_link<cr>")
-- km("i", "<c-l>", "<esc><cmd>Telekasten insert_link<cr>")
-- km("n", "<Tab>", "<esc><cmd>Telekasten follow_link<cr>")

-- trouble
km("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>")
km("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>")

-- dap
km("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
km("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>")
km("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>")
km("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>")

-- chatgpt
-- km("n", "<leader>pt", "<cmd>ChatGPT<cr>")

-- misc
km("n", "<leader>d", "<cmd>Neogen<cr>")
km("n", "<leader>t", "<cmd>lua require('toggle-checkbox').toggle()<cr>")
km("n", "<leader>b", "<cmd>GitBlameToggle<cr>")
km("", "<leader>l", "<cmd>lua require('lsp_lines').toggle()<cr>")
km("", "<leader>g", "<esc><cmd>Glow<cr>")
km("n", "<leader>s", "<cmd>lua require('spectre').toggle()<cr>")
