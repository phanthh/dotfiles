local km = require("utils").keymap

-------------- NATIVES

-- motions
km("i", "jf", "<esc><cmd>HopWord<cr>")
km("i", "jj", "<esc>")
km("n", "<leader><leader>", "<cmd>HopWord<cr>")
km("v", "<c-p>", "<cmd>m '<-2<cr>gv=gv")
km("v", "<c-n>", "<cmd>m '>+1<cr>gv=gv")
km("v", "p", '"_dP')

-- saving
km("n", "<c-s>", "<cmd>wa<bar>lua vim.lsp.buf.format()<cr>")
km("i", "<c-s>", "<esc><cmd>wa<bar>lua vim.lsp.buf.format()<cr>")

-- buffers
km("n", "<c-w>i", "<cmd>bnext<cr>")
km("n", "<c-w>u", "<cmd>bprev<cr>")
km("n", "<c-w>w", "<cmd>wa<bar>bdelete<cr>")
km("n", "<c-w>0", "<cmd>bfirst<cr")
km("n", "<c-w>$", "<cmd>blast<cr>")

-------------- PLUGINS

-- telescope
km("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
km("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

km("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
km("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")

-- nvim-tree
km("n", "<c-n>", "<cmd>NvimTreeToggle<cr>")
km("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>")

-- harpoon
km("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>")
km("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

for i = 1, 9 do
	km("n", "<leader>" .. i, string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<cr>", i))
end

-- git
km("n", "<leader>b", "<cmd>GitBlameToggle<cr>")

-- minimap
km("n", "<leader>m", "<cmd>MinimapToggle<cr>")

-- repl
km("n", "<leader>rs", "<cmd>IronRepl<cr>")
km("n", "<leader>rr", "<cmd>IronRestart<cr>")
km("n", "<leader>rf", "<cmd>IronFocus<cr>")
km("n", "<leader>rh", "<cmd>IronHide<cr>")

-- misc
km("n", "gdd", "<cmd>Neogen<cr>")
km("", "<leader>l", "<cmd>lua require('lsp_lines').toggle()<cr>")
