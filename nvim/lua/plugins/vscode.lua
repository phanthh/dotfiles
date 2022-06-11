vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 0
vim.g.vscode_italic_comment = 0
vim.g.vscode_disable_nvimtree_bg = false

-- override
local u = require("utils")
local default = require("vscode.colors").generate()

require("vscode.colors").generate = function()
	local override = {
		vscBack = "#101010",
		vscLeftDark = "#050505",
		vscPopupBack = "#101010",
		vscPopupFront = "#FFFFFF",
		vscPopupHighlightBlue = "#9CDCFE",
	}
	return u.concat(default, override)
end
