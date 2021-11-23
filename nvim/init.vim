"=============================" SETTINGS
filetype plugin on

" misc
set hidden
set noerrorbells


" speed
set updatetime=50
set encoding=utf-8
set shortmess+=Ic

" visual
syntax on
set number 
set numberwidth=5 
set relativenumber 
set scrolloff=10
set signcolumn=yes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" soft-wrap at 80
set wrap
set linebreak

" search
set nohlsearch
set incsearch
set ignorecase 

" key 
set timeout timeoutlen=350 
set ttimeout ttimeoutlen=350 
set backspace=indent,eol,start
set clipboard=unnamedplus

" spacing
set tabstop=2 softtabstop=2
set shiftwidth=2 
set expandtab
set smartindent

" mouse scrolling
set mouse=a

" backup
set history=1000 
set backup
set undolevels=1000
set undofile
if has("nvim") && has("unix")
  set backupdir=~/.local/share/nvim/backup
endif

" default
set shell=/usr/bin/zsh
set splitbelow
set splitright
if !has('nvim') 
	set viminfofile=~/.vim/viminfo
endif

" gui
set guifont=Hack\ Nerd\ Font:h12

" dictionary and thesaurus
" set dictionary+=/usr/share/dict/american-english

" leader key
let mapleader=" "

"=============================" PLUGINS
call plug#begin('~/.config/nvim/plugged') 
" lsp + completion engine
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" visual
Plug 'lilydjwg/colorizer'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'

" writing
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'rhysd/vim-grammarous'
Plug 'vimwiki/vimwiki'
" Plug 'reedes/vim-pencil'

" general tools
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" misc
Plug 'ElPiloto/telescope-vimwiki.nvim'
call plug#end()            

"=============================" PLUGINS SETTINGS
" colorscheme================="
let g:gruvbox_contrast_dark = 'hard'
colorscheme moonfly
" vimtex======================"
let g:vimtex_syntax_enabled = 0
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_method = 'zathura'

" grammarous=================="
let g:grammarous#languagetool_cmd = '/usr/bin/languagetool'
let g:grammarous#disabled_rules = {
            \ 'tex' : ['UNIT_SPACE', 'EN_UNPAIRED_BRACKETS'],
            \ }
let g:grammarous#disabled_categories = {
            \ 'tex' : ['TYPOGRAPHY'],
            \ }
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><c-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><c-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><c-n>
    nunmap <buffer><c-p>
endfunction

" vimwiki======================"
let g:vimwiki_auto_chdir = 1
let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_key_mappings = { 'all_maps': 0, }
let g:vimwiki_list = [{'path': '~/Academia/PKM/', 
			\'name': 'PKM', 
			\'syntax': 'markdown', 
			\'ext': '.md'}]

"  lua========================="
lua << EOF

-- nvim_lsp--------------------
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  ---buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
end

-- nvim_cmp--------------------
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) 
		end,
	},
	mapping = {
		['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<c-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<c-y>'] = cmp.config.disable, 
		['<c-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<cr>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' }, 
		{ name = 'path'},		
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})

-- lsps setup.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { 'pyright', 'rust_analyzer', 'texlab', 'clangd', 'vimls', 'tsserver', 'bashls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
		capabilities = capabilities,
  }
end

--telescope-vimwiki.nvim_lsp--
require('telescope').load_extension('vimwiki')
EOF

"=============================" KEYMAPS
" core========================"
inoremap jj <esc>:w<cr>
inoremap jk <esc>:w<cr>
nnoremap j gj
nnoremap k gk
inoremap <c-H> <c-w>

" qol========================="
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u
inoremap : :<c-g>u
inoremap - -<c-g>u
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <c-k> <esc>:m .-2<cr>==
inoremap <c-j> <esc>:m .+1<cr>==
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" navs========================"
nnoremap <silent> <c-w><Up> :wincmd +<cr>
nnoremap <silent> <c-w><Down> :wincmd -<cr>
nnoremap <silent> <c-w><Left> :wincmd <<cr>
nnoremap <silent> <c-w><Right> :wincmd ><cr>
nnoremap <silent> <c-w>w :vsplit <cr>
nnoremap <silent> <c-w>s :split <cr>
nnoremap <silent> <c-w>x :close <cr>

" utils======================="
noremap <F10> <esc>:w <bar> :!crun %<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
noremap <F12> :GrammarousCheck <cr>
noremap <S-F12> :GrammarousReset <cr>
nmap gf <Plug>(grammarous-fixit)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" autopair===================="
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O

"=============================" LANGUAGE SPECS
function s:spec_tex()
  " call pencil#init()
  set spell spelllang=en_us 
  set foldlevel=99
	set conceallevel=2
  set foldmethod=expr 
  set foldexpr=vimtex#fold#level(v:lnum) 
  set foldtext=vimtex#fold#text()

  map <F10> :w <bar> :VimtexCompile <cr><cr>
  imap <F10> <esc> :w <bar> :VimtexCompile <cr><cr>
  nnoremap <leader><leader> za 
endfunction

function s:spec_markdown()
  " call pencil#init()
  set spell spelllang=en_us
endfunction

function s:spec_vimwiki()
  " call pencil#init()
  set spell spelllang=en_us
  inoremap ]] <esc><cmd>Telescope vimwiki link<cr>
  nnoremap <tab> <cmd>VimwikiFollowLink<cr>
  unmap ' 
  unmap "
  inoremap * **<left>

endfunction

function s:spec_rust()
	map <S-F10> :w <bar> :!cargo run <cr>
	imap <S-F10> <esc> :w <bar> :!cargo run<cr>
endfunction

function s:spec_scala()
  map <S-F10> :w <bar> :!sbt run <cr>
  map <S-F10> <esc> :w <bar> :!sbt run<cr>
  map <F9> :w <bar> :!sbt test <cr>
  imap <F9> <esc> :w <bar> :!sbt test<>
endfunction

function s:spec_python()
	map <F8> :w <bar> :silent exec "!autopep8 -i %" <bar> :e <cr>
	imap <F8> <esc>:w <bar> :silent exec "!autopep8 -i %" <bar> :e <cr>
endfunction

augroup s:spec
  autocmd!
  autocmd FileType tex call s:spec_tex()
  autocmd FileType markdown call s:spec_markdown()
  autocmd FileType vimwiki call s:spec_vimwiki()
  autocmd FileType rust call s:spec_vimwiki()
	autocmd FileType scala call s:spec_scala()
	autocmd FileType python call s:spec_python()
augroup end
