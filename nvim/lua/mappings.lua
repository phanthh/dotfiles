-- Key map
local km = require("utils").keymap
local opts = { noremap = true, silent = true }
km("i", "jj", "<esc>", opts)
km("n", "<c-s>", "<cmd>wa<cr>", opts)
km("i", "<c-s>", "<esc><cmd>wa<cr>", opts)
-- km("n", "j", "gj", opts)
-- km("n", "k", "gk", opts)
km("n", "<c-w>i", ":bnext<cr>", opts)
km("n", "<c-w>u", ":bprev<cr>", opts)
km("n", "<c-w>w", ":Bdelete<cr> ", opts)
km("n", "<c-w>0", ":bfirst<cr", opts)
km("n", "<c-w>$", ":blast<cr>", opts)
km("n", "<f10>", "<esc>:w<bar>:!util_crun %<cr>", opts)
km("x", "ga", "<Plug>(EasyAlign)", opts)
km("n", "ga", "<Plug>(EasyAlign)", opts)
km("v", "J", ":m '>+1<cr>gv=gv", opts)
km("v", "K", ":m '<-2<cr>gv=gv", opts)
km("n", "<c-n>", ":NvimTreeToggle<cr>", opts)
km("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
km("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
km("n", "gdd", "<cmd>Neogen<cr>", opts)
km("n", "<c-f>", "<cmd>HopWord<cr>", opts)
km("i", "jf", "<esc><cmd>HopWord<cr>", opts)

-- terminal
-- km("n", "<c-a>v", "<cmd>vsplit term://$SHELL<bar>startinsert<cr>", opts)
-- km("n", "<c-a>s", "<cmd>split term://$SHELL<bar>startinsert<cr>", opts)
-- km("t", "<c-a>v", "<cmd>vsplit term://$SHELL<bar>startinsert<cr>", opts)
-- km("t", "<c-a>s", "<cmd>split term://$SHELL<bar>startinsert<cr>", opts)
--
-- for _, v in pairs({ "i", "t", "n" }) do
-- 	km(v, "<c-a>j", "<c-\\><c-n><c-w>j", opts)
-- 	km(v, "<c-a>k", "<c-\\><c-n><c-w>k", opts)
-- 	km(v, "<c-a>h", "<c-\\><c-n><c-w>h", opts)
-- 	km(v, "<c-a>l", "<c-\\><c-n><c-w>l", opts)
-- 	km(v, "<c-a>c", "<c-\\><c-n><c-w>c", opts)
-- end
