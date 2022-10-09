-- Key map
local km = require("utils").keymap

-- motions
km("i", "jf", "<esc>:HopWord<cr>")
km("i", "jj", "<esc>")
km("n", "<leader><leader>", ":HopWord<cr>")
km("v", "<", ":m '>+1<cr>gv=gv")
km("v", ">", ":m '<-2<cr>gv=gv")
km("v", "p", '"_dP')

-- saving
km("n", "<c-s>", ":wa<bar>:lua vim.lsp.buf.formatting()<cr>")
km("i", "<c-s>", "<esc>:wa<bar>:lua vim.lsp.buf.formatting()<cr>")

-- buffers
km("n", "<c-w>i", ":bnext<cr>")
km("n", "<c-w>u", ":bprev<cr>")
km("n", "<c-w>w", ":wa<bar>Bdelete<cr> ")
km("n", "<c-w>0", ":bfirst<cr")
km("n", "<c-w>$", ":blast<cr>")

-- telescope
km("n", "<leader>fw", ":Telescope live_grep<cr>")
km("n", "<leader>ff", ":Telescope find_files<cr>")
km("n", "<leader>fg", ":Telescope git_files<cr>")
km("n", "<leader>fb", ":Telescope buffers<cr>")
km("n", "<leader>fh", ":Telescope help_tags<cr>")

-- nvim-tree
km("n", "<c-n>", ":NvimTreeToggle<cr>")
km("n", "<leader>r", ":NvimTreeRefresh<cr>")

-- harpoon
km("n", "<leader>a", ":lua require('harpoon.mark').add_file()<cr>")
km("n", "<leader>0", ":lua require('harpoon.ui').toggle_quick_menu()<cr>")

for i = 1, 9 do
	km("n", "<leader>" .. i, string.format(":lua require('harpoon.ui').nav_file(%d)<cr>", i))
end

-- git
-- km("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
km("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<cr>")
km("n", "<leader>gc", ":lua require('telescope.builtin').git_commits()<cr>")
km("n", "<leader>b", ":GitBlameToggle<cr>")
