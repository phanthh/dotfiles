-- Key map
local km = require("utils").keymap

-- motions
km("i", "jj", "<esc>")
km("n", "<c-f>", "<cmd>HopWord<cr>")
km("i", "jf", "<esc><cmd>HopWord<cr>")
km("v", "N", ":m '>+1<cr>gv=gv") -- multiline jump
km("v", "P", ":m '<-2<cr>gv=gv")

-- saving
km("n", "<c-s>", "<cmd>wa<cr>")
km("i", "<c-s>", "<esc><cmd>wa<cr>")

-- buffers
km("n", "<c-w>i", ":bnext<cr>")
km("n", "<c-w>u", ":bprev<cr>")
km("n", "<c-w>w", ":Bdelete<cr> ")
km("n", "<c-w>0", ":bfirst<cr")
km("n", "<c-w>$", ":blast<cr>")

-- telescope
km("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
km("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- nvim-tree
km("n", "<c-n>", ":NvimTreeToggle<cr>")
km("n", "<leader>r", ":NvimTreeRefresh<cr>")
