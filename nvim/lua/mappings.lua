-- Key map
local km = require('utils').keymap
local opts = { noremap = true, silent = true }
km("i", "jj", "<esc><cmd>w<cr>", opts)
km("n", "j", "gj", opts)
km("n", "k", "gk", opts)
km("n", "<c-w>i", ":tabnext<cr>", opts)
km("n", "<c-w>u", ":tabprevious<cr>", opts)
km("n", "<c-w>0", ":tabfirst<cr", opts)
km("n", "<c-w>$", ":tablast<cr>", opts)
km("n", "<c-w>t", ":tabnew<cr> ", opts)
km("n", "<f10>", "<esc>:w<bar>:!util_crun %<cr>", opts)
km("x", "ga", "<Plug>(EasyAlign)", opts)
km("n", "ga", "<Plug>(EasyAlign)", opts)
km("v", "J", ":m '>+1<cr>gv=gv", opts)
km("v", "K", ":m '<-2<cr>gv=gv", opts)
km("n", "<c-n>", ":NvimTreeToggle<cr>", opts)
km("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)
km("n", "<f8>", ":Neoformat<cr>", opts)
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
km("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
km("n", "f", "<cmd>HopWord<cr>", opts)
km("i", "jf", "<esc><cmd>HopWord<cr>", opts)
