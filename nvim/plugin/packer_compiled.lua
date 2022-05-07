-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/phanthh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/phanthh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/phanthh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/phanthh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/phanthh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.luasnip\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dictionary"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.vim" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.cmp-dictionary\frequire\0" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["faster.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\t\0\0185\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\27<Plug>(faster_move_gk)\6k\27<Plug>(faster_move_gj)\6j\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\1\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/faster.nvim",
    url = "https://github.com/PHSix/faster.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugins.ft\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord" },
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\26etovqpdygflzhckisuran\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupyter_ascending.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\6 \tleft\6 \25component_separators\1\0\2\nright\6 \tleft\6 \1\0\1\ntheme\vvscode\nsetup\flualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nabla.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  neogen = {
    commands = { "Neogen" },
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\b\0\14\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0006\1\0\0'\3\1\0B\1\2\0029\1\2\0019\1\4\0016\2\0\0'\4\1\0B\2\2\0029\2\2\0029\2\5\0026\3\0\0'\5\1\0B\3\2\0029\3\6\0035\5\f\0004\6\6\0009\a\a\0>\a\1\0069\a\b\0>\a\2\0069\a\t\0>\a\3\0069\a\n\0>\a\4\0069\a\v\0>\a\5\6=\6\r\5B\3\2\1K\0\1\0\fsources\1\0\0\nshfmt\frustfmt\rprettier\nblack\17clang_format\nsetup\15completion\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    keys = { { "i", "(" }, { "i", "{" }, { "i", "[" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\rLspStart\bcmd\bvim\21plugins.nvim-cmp\frequire\0" },
    keys = { { "", "g" }, { "", "K" }, { "", "[" }, { "", "]" }, { "", "<c-k>" }, { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["swhkd-vim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/swhkd-vim",
    url = "https://github.com/waycrate/swhkd-vim"
  },
  ["telekasten.nvim"] = {
    commands = { "Telekasten" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.telekasten\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tidy.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/tidy.nvim",
    url = "https://github.com/McAuleyPenney/tidy.nvim"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "G" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grammarous"] = {
    commands = { "GrammarousCheck", "GrammarousReset" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.vim-grammarous\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-sendtowindow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-sendtowindow",
    url = "https://github.com/karoliskoncevicius/vim-sendtowindow"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  vimtex = {
    commands = { "VimtexCompile" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.vimtex\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\23colorscheme vscode\bcmd\bvim\26plugins.vscode.config\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp_nvim_lsp"] = "cmp-nvim-lsp",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^luasnip"] = "LuaSnip",
  ["^nabla"] = "nabla.nvim",
  ["^nvim%-lsp%-ts%-utils"] = "nvim-lsp-ts-utils",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\23colorscheme vscode\bcmd\bvim\26plugins.vscode.config\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\b\0\14\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0006\1\0\0'\3\1\0B\1\2\0029\1\2\0019\1\4\0016\2\0\0'\4\1\0B\2\2\0029\2\2\0029\2\5\0026\3\0\0'\5\1\0B\3\2\0029\3\6\0035\5\f\0004\6\6\0009\a\a\0>\a\1\0069\a\b\0>\a\2\0069\a\t\0>\a\3\0069\a\n\0>\a\4\0069\a\v\0>\a\5\6=\6\r\5B\3\2\1K\0\1\0\fsources\1\0\0\nshfmt\frustfmt\rprettier\nblack\17clang_format\nsetup\15completion\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugins.ft\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telekasten lua require("packer.load")({'telekasten.nvim'}, { cmd = "Telekasten", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GrammarousCheck lua require("packer.load")({'vim-grammarous'}, { cmd = "GrammarousCheck", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GrammarousReset lua require("packer.load")({'vim-grammarous'}, { cmd = "GrammarousReset", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VimtexCompile lua require("packer.load")({'vimtex'}, { cmd = "VimtexCompile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogen lua require("packer.load")({'neogen'}, { cmd = "Neogen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-path'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-path'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-path'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> ( <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "(" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-path'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-path'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> [ <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "[" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> { <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "{" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-buffer'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-path'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType toml ++once lua require("packer.load")({'lualine.nvim', 'nvim-colorizer.lua'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'lualine.nvim', 'nvim-colorizer.lua'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType cfg ++once lua require("packer.load")({'lualine.nvim', 'nvim-colorizer.lua'}, { ft = "cfg" }, _G.packer_plugins)]]
vim.cmd [[au FileType r ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "r" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'jupyter_ascending.vim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'lualine.nvim', 'nvim-colorizer.lua'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'lualine.nvim', 'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua', 'nvim-colorizer.lua'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType dosini ++once lua require("packer.load")({'lualine.nvim', 'nvim-colorizer.lua'}, { ft = "dosini" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp-cmdline', 'nvim-cmp', 'cmp-buffer', 'surround.nvim', 'cmp_luasnip', 'cmp-dictionary', 'cmp-path', 'cmp-nvim-lsp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'faster.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'numb.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'tidy.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
vim.cmd [[au TermOpen * ++once lua require("packer.load")({'vim-sendtowindow'}, { event = "TermOpen *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end