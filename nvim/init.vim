"============================="
call plug#begin('~/.config/nvim/plugged') 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'lilydjwg/colorizer'
Plug 'tomasiser/vim-code-dark'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dpelle/vim-LanguageTool'
Plug 'junegunn/vim-easy-align'
call plug#end()            
"============================="
filetype plugin on
syntax on
set updatetime=300
set encoding=utf-8
set shortmess+=Ic
" Indicator
set colorcolumn=80
set textwidth=80
set foldlevel=99
set belloff=all
set number
set numberwidth=5
set relativenumber
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Search
set incsearch
set hlsearch
set ignorecase 
" Key 
set timeout 
set timeoutlen=350 
set ttimeout 
set ttimeoutlen=350 
set autoindent 
set backspace=indent,eol,start
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
" Mouse
set mouse=a
" Color
colorscheme codedark
" Shell
if has("unix")
  set shell=/usr/bin/zsh
endif
" Safe guard
set history=1000 
set backup
set undolevels=1000
set undofile

if has("nvim") && has("unix")
  set backupdir=~/.local/share/nvim/backup
endif
" Viminfo file
if !has('nvim') 
	set viminfofile=~/.vim/viminfo
endif

" Split position
set splitbelow
set splitright

let mapleader=" "
"============================="
let g:vimtex_syntax_enabled = 0
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_method = 'zathura'
"============================="
inoremap jj <Esc>:w<cr>
inoremap jk <Esc>:w<cr>
inoremap <C-H> <C-w>
nmap <silent> <Tab> :nohl<CR>
nmap <silent> <C-w><Up> :wincmd +<CR>
nmap <silent> <C-w><Down> :wincmd -<CR>
nmap <silent> <C-w><Left> :wincmd <<CR>
nmap <silent> <C-w><Right> :wincmd ><CR>
nmap <silent> <C-w>w :vsplit <CR>
nmap <silent> <C-w>s :split <CR>
nmap <silent> <C-w>x :close <CR>
nmap <F10> :w <bar> :!crun %<CR>
imap <F10> <Esc> :w <bar> :!crun %<CR>
nmap <F12> :LanguageToolCheck<CR>
nmap <S-F12> :LanguageToolClear<CR>
"============================="
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"============================="
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"============================="
function Latex()
  set spell spelllang=en_us 
  set formatoptions-=cro
	set conceallevel=2
  set foldmethod=expr 
  set foldexpr=vimtex#fold#level(v:lnum) 
  set foldtext=vimtex#fold#text()
	set norelativenumber
  map <F10> :w <bar> :VimtexCompile <CR><CR>
  imap <F10> <Esc> :w <bar> :VimtexCompile <CR><CR>
  nnoremap <leader><leader> za 
endfunction

function Markdown()
	set spell spelllang=en_us
endfunction

function Rust()
	map <S-F10> :w <bar> :!cargo run <CR>
	imap <S-F10> <Esc> :w <bar> :!cargo run<CR>
endfunction

function Scala()
  map <S-F10> :w <bar> :!sbt run <CR>
  map <S-F10> <Esc> :w <bar> :!sbt run<CR>
  map <F9> :w <bar> :!sbt test <CR>
  imap <F9> <Esc> :w <bar> :!sbt test<CR>
endfunction

function Python()
	map <F8> :w <bar> :silent exec "!autopep8 -i %" <bar> :e <CR>
	imap <F8> <ESC>:w <bar> :silent exec "!autopep8 -i %" <bar> :e <CR>
endfunction

augroup LangSpecs
  autocmd!
  autocmd FileType tex call Latex()
  autocmd FileType markdown call Markdown()
  autocmd FileType text set spell spelllang=en_us
  autocmd FileType rust call Rust()
	autocmd FileType scala call Scala()
	autocmd FileType python call Python()
augroup end

"============================="
let g:languagetool_cmd='/usr/bin/languagetool'
"============================="
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, 
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name= 'path'},
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, -- For ultisnips users.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'texlab', 'clangd', 'vimls', 'tsserver', 'bashls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
		capabilities = capabilities,
  }
end
EOF
