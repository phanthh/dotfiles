-- Key map
local km = require("utils").keymap
local opts = { noremap = true, silent = true }

-- motions
km("i", "jj", "<esc>", opts)
km("n", "<c-f>", "<cmd>HopWord<cr>", opts)
km("i", "jf", "<esc><cmd>HopWord<cr>", opts)
km("v", "N", ":m '>+1<cr>gv=gv", opts) -- multiline jump
km("v", "P", ":m '<-2<cr>gv=gv", opts)

-- saving
km("n", "<c-s>", "<cmd>wa<cr>", opts)
km("i", "<c-s>", "<esc><cmd>wa<cr>", opts)

-- buffers
km("n", "<c-w>i", ":bnext<cr>", opts)
km("n", "<c-w>u", ":bprev<cr>", opts)
km("n", "<c-w>w", ":Bdelete<cr> ", opts)
km("n", "<c-w>0", ":bfirst<cr", opts)
km("n", "<c-w>$", ":blast<cr>", opts)

-- telescope
km("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- nvim-tree
km("n", "<c-n>", ":NvimTreeToggle<cr>", opts)
km("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)
