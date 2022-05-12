-- Settings
local home = os.getenv("HOME")
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 350
vim.o.ttimeout = true
vim.o.ttimeoutlen = 350
vim.o.lazyredraw = false -- gui
vim.o.showmode = false -- gui
vim.o.autoindent = false
vim.o.autoread = true

-- visual
vim.o.numberwidth = 5
vim.o.signcolumn = "number"
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.guifont = "Hack Nerd Font:h12"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 7

-- tab
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true

-- wrap
vim.o.wrap = true
vim.o.linebreak = true

-- safety net
vim.o.backup = true
vim.o.backupdir = home .. "/.local/share/nvim/backup"
vim.o.history = 1000
vim.o.undolevels = 1000
vim.o.undofile = true

-- misc
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.hidden = false
vim.o.shell = "/bin/sh"
vim.o.shortmess = vim.o.shortmess .. "Ic"
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.backspace = "indent,eol,start"

vim.g.mapleader = " "

vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python"

-- disable unnecessary plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"rplugin",
	"spellfile_plugin",
	"matchit",
	-- "python3_provider",
	-- "python2_provider",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
