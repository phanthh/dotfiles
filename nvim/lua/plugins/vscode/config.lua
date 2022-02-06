vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 1
-- override
local default = require("vscode.colors").generate()
local concat = require("utils").concat
local generate = function()
	local colors
	if vim.g.vscode_style == "dark" then
		colors = concat(default, require("plugins.vscode.dark").override)
	else
		colors = concat(default, require("plugins.vscode.light").override)
	end
	return colors
end

require("vscode.colors").generate = generate
