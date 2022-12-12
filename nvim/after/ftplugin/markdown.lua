require("utils").write_spec()
local km = require("utils").keymap
km("n", "<leader>z", ":Telekasten panel<cr>")
km("n", "<leader>zf", ":Telekasten find_notes<cr>")
km("n", "<leader>zg", ":Telekasten search_notes<cr>")
km("n", "<leader>zp", ":Telekasten paste_img_and_link<cr>")
km("i", "<c-l>", "<esc><cmd>:Telekasten insert_link<cr>")
km("n", "<Tab>", "<esc><cmd>:Telekasten follow_link<cr>")
km("", "<leader>g", "<esc>:Glow<cr>")
km("n", "<leader>t", ":lua require('toggle-checkbox').toggle()<cr>")

-- vim.keymap.set("n", "gf", function()
-- 	if require("obsidian").util.cursor_on_markdown_link() then
-- 		return "<cmd>ObsidianFollowLink<CR>"
-- 	else
-- 		return "gf"
-- 	end
-- end, { noremap = false, expr = true })
