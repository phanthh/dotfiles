-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs.Comment\frequire\0" },
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.bufferline\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
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
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.cmp-dictionary\frequire\0" },
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
  ["colorful-winsep.nvim"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\nguibg\f#16161E\nguifg\f#d79921\nsetup\20colorful-winsep\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/colorful-winsep.nvim",
    url = "https://github.com/nvim-zh/colorful-winsep.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["faster.nvim"] = {
    config = { "\27LJ\2\n¯\1\0\0\a\0\t\0\0185\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\27<Plug>(faster_move_gk)\6k\27<Plug>(faster_move_gj)\6j\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\1\vsilent\2\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/faster.nvim",
    url = "https://github.com/PHSix/faster.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fsread.nvim"] = {
    commands = { "FSRead", "FSToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/fsread.nvim",
    url = "https://github.com/nullchilly/fsread.nvim"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21gitblame_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17configs.glow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\tdark\15background\6o\bvim\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
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
  ["iron.nvim"] = {
    commands = { "IronRepl" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17configs.iron\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs.lualine\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["minimap.vim"] = {
    commands = { "MinimapToggle" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs.minimap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  neogen = {
    commands = { "Neogen" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs.neogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
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
    config = { "\27LJ\2\nÊ\1\0\0\3\0\t\0\0206\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\rLspStart\bcmd\bvim\22configs.lsp_lines\21configs.nvim-cmp\20configs.null-ls\27configs.nvim-lspconfig\20configs.luasnip\frequire\0" },
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
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    after = { "fidget.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28configs.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nC\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0(configs.nvim-treesitter-textobjects\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
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
  ["rest.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\28result_split_horizontal\2\nsetup\14rest-nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["telekasten.nvim"] = {
    commands = { "Telekasten" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.telekasten\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tidy.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttidy\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/tidy.nvim",
    url = "https://github.com/mcauley-penney/tidy.nvim"
  },
  ["toggle-checkbox.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/toggle-checkbox.nvim",
    url = "https://github.com/opdavies/toggle-checkbox.nvim"
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
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.vim-grammarous\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs.vscode\frequire\0" },
    loaded = true,
    path = "/home/phanthh/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp_nvim_lsp"] = "cmp-nvim-lsp",
  ["^lsp_lines"] = "lsp_lines.nvim",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^lspkind"] = "lspkind.nvim",
  ["^luasnip"] = "LuaSnip",
  ["^null%-ls"] = "null-ls.nvim",
  ["^nvim%-lsp%-ts%-utils"] = "nvim-lsp-ts-utils",
  ["^telescope"] = "telescope.nvim",
  ["^toggle%-checkbox"] = "toggle-checkbox.nvim"
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

-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: tidy.nvim
time([[Config for tidy.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttidy\frequire\0", "config", "tidy.nvim")
time([[Config for tidy.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\tdark\15background\6o\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28configs.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: colorful-winsep.nvim
time([[Config for colorful-winsep.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\nguibg\f#16161E\nguifg\f#d79921\nsetup\20colorful-winsep\frequire\0", "config", "colorful-winsep.nvim")
time([[Config for colorful-winsep.nvim]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs.vscode\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21gitblame_enabled\6g\bvim\0", "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0(configs.nvim-treesitter-textobjects\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'FSRead', function(cmdargs)
          require('packer.load')({'fsread.nvim'}, { cmd = 'FSRead', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fsread.nvim'}, { cmd = 'FSRead' }, _G.packer_plugins)
          return vim.fn.getcompletion('FSRead ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FSToggle', function(cmdargs)
          require('packer.load')({'fsread.nvim'}, { cmd = 'FSToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fsread.nvim'}, { cmd = 'FSToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('FSToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MinimapToggle', function(cmdargs)
          require('packer.load')({'minimap.vim'}, { cmd = 'MinimapToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'minimap.vim'}, { cmd = 'MinimapToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('MinimapToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Git', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git' }, _G.packer_plugins)
          return vim.fn.getcompletion('Git ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, { cmd = 'G' }, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogen', function(cmdargs)
          require('packer.load')({'neogen'}, { cmd = 'Neogen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogen'}, { cmd = 'Neogen' }, _G.packer_plugins)
          return vim.fn.getcompletion('Neogen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'IronRepl', function(cmdargs)
          require('packer.load')({'iron.nvim'}, { cmd = 'IronRepl', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'iron.nvim'}, { cmd = 'IronRepl' }, _G.packer_plugins)
          return vim.fn.getcompletion('IronRepl ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime' }, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope' }, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telekasten', function(cmdargs)
          require('packer.load')({'telekasten.nvim'}, { cmd = 'Telekasten', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telekasten.nvim'}, { cmd = 'Telekasten' }, _G.packer_plugins)
          return vim.fn.getcompletion('Telekasten ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GrammarousCheck', function(cmdargs)
          require('packer.load')({'vim-grammarous'}, { cmd = 'GrammarousCheck', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-grammarous'}, { cmd = 'GrammarousCheck' }, _G.packer_plugins)
          return vim.fn.getcompletion('GrammarousCheck ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GrammarousReset', function(cmdargs)
          require('packer.load')({'vim-grammarous'}, { cmd = 'GrammarousReset', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-grammarous'}, { cmd = 'GrammarousReset' }, _G.packer_plugins)
          return vim.fn.getcompletion('GrammarousReset ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWord', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWord' }, _G.packer_plugins)
          return vim.fn.getcompletion('HopWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glow', function(cmdargs)
          require('packer.load')({'glow.nvim'}, { cmd = 'Glow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'glow.nvim'}, { cmd = 'Glow' }, _G.packer_plugins)
          return vim.fn.getcompletion('Glow ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-path'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-path'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-path'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> { <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "{" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-dictionary'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'nvim-cmp'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-cmdline'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-k> <cmd>lua require("packer.load")({'cmp-path'}, { keys = "<lt>c-k>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp_luasnip'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> [ <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "[" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> K <cmd>lua require("packer.load")({'cmp-path'}, { keys = "K", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g <cmd>lua require("packer.load")({'cmp-path'}, { keys = "g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> ( <cmd>lua require("packer.load")({'nvim-autopairs'}, { keys = "(" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'cmp-nvim-lsp'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType dosini ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "dosini" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType cfg ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "cfg" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType r ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "r" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'indent-blankline.nvim', 'gitsigns.nvim', 'nvim-colorizer.lua'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'faster.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'numb.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp-dictionary', 'cmp-cmdline', 'cmp-path', 'cmp_luasnip', 'nvim-cmp', 'surround.nvim', 'cmp-nvim-lsp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'cmp-dictionary', 'cmp-cmdline', 'cmp-path', 'cmp_luasnip', 'nvim-cmp', 'cmp-nvim-lsp'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/phanthh/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /home/phanthh/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /home/phanthh/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
