-- Settings
local home = os.getenv("HOME")

vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 350
vim.o.ttimeout = true
vim.o.ttimeoutlen = 350
vim.o.lazyredraw = false -- gui
vim.o.showmode = false -- gui
vim.o.autoread = true
-- vim.o.cmdheight = 0

-- visual
vim.o.numberwidth = 5
vim.o.signcolumn = "number"
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.guifont = "Hack Nerd Font:h12"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 7
vim.o.background = "dark"

-- tab
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.softtabstop = 4

-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- wrap
vim.o.wrap = true
vim.o.linebreak = true

-- safety net
vim.o.autowrite = true
vim.o.backup = true
vim.o.backupdir = home .. "/.local/share/nvim/backup"
vim.o.history = 1000
vim.o.undolevels = 1000
vim.o.undofile = true

-- misc
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.spelloptions = "noplainbuffer"
vim.o.hidden = false

vim.o.ruler = true
vim.o.showcmd = true
vim.o.number = true
vim.o.shell = "/bin/sh"
vim.o.shortmess = vim.o.shortmess .. "Ic"
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.backspace = "indent,eol,start"

vim.g.mapleader = " "

-- vim.g.python_host_prog = "/usr/bin/python2"
-- vim.g.python3_host_prog = "/usr/bin/python"

vim.cmd([[
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
]])

vim.g.omni_sql_default_compl_type = "syntax"
