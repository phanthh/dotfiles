"============================= PLUGINS =============================" 

call plug#begin('~/.config/nvim/plugged') 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' 
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'tomasiser/vim-code-dark'
call plug#end()            

"============================= OPTIONS ==============================="

filetype plugin indent on
syntax on

" Coc.nvim
set hidden
set wildmenu
set updatetime=250
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

set t_Co=256
set ttyfast

" Search
set incsearch
set hlsearch
set ignorecase

" Key
set timeout 
set timeoutlen=350
set ttimeout 
set ttimeoutlen=350

" Type
set autoindent 
set copyindent
set backspace=indent,eol,start
set clipboard=unnamedplus
set tabstop=2
set expandtab 
set smarttab
set shiftwidth=2

" Mouse
set mouse=a

" File
set autoread
set laststatus=1
set formatoptions+=t
set formatoptions-=l

" Color
colorscheme codedark

" Shell
if has("unix")
  set shell=/usr/bin/zsh\ -l
endif

" Safe guard
set history=1000 
set backup
set undolevels=1000
set undofile

if has("nvim") && has("unix")
  set backupdir=~/.local/share/nvim/backup
endif

if has("gui_running")
  set guifont=Consolas:h20:cANSI
  set guioptions=
  set guioptions+=c
endif

"============================= COCNVIM =============================" 

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"========================= KEY BINDS ============================="

" Leader
nnoremap <SPACE> <Nop>
inoremap jj <Esc>

let mapleader=" "

" ZZ : Save and quit
" ZQ : Save without quit

nnoremap <TAB> :nohl<CR>
nnoremap <F12> :source ~/.config/nvim/init.vim <CR>

" Switch Pane
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>

nmap <silent> <leader>K :wincmd K<CR>
nmap <silent> <leader>J :wincmd J<CR>
nmap <silent> <leader>G :wincmd H<CR>
nmap <silent> <leader>L :wincmd L<CR>

nmap <silent> <leader>w :vsplit <bar> wincmd l<CR>
nmap <silent> <leader>v :split <bar> wincmd j<CR> 

" Switch Buffer
nmap <silent> <leader>i :bnext<CR>
nmap <silent> <leader>u :bprev<CR>

" Nerd tree
nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeFocus<CR>R<CR>

" FZF Search
nmap <silent> <leader>o :GFiles<CR>
nmap <silent> <leader>p :Buffers<CR>

" Execute
map <F10> :w <bar> :!run %<CR>
imap <F10> <Esc> :w <bar> :!run %<CR>

" Visual paste 
vnoremap p "_c<C-r><C-o>+<Esc>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"========================= PLUGINS CONFIG =========================="

" Coc-pairs blacklist <
autocmd FileType rust,cpp,c,javascript,typescript let b:coc_pairs_disabled = ['<']

" Nerdtree
let NERDTreeIgnore = ['\.pyc$', 'node_modules']
let NERDTreeMapActivateNode='l'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python highlight
let g:python_highlight_all = 1 

" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

" Latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_enabled = 1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Python path
if has("unix")
  let g:python3_host_prog='/usr/bin/python'
endif

" Airline theme
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 1

" Use system clipboard wsl

" let s:clip = '/mnt/c/Windows/System32/clip.exe'
" if executable(s:clip)
"   augroup WSLYank
"     autocmd!
"     autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"   augroup END
" endif

" Language specific configuration
augroup LangSpecs
  autocmd!
  " Latex
  autocmd FileType tex call LatexFunc()

  " Markdown
  autocmd FileType markdown set spell spelllang=en_us

  " Txt
  autocmd FileType text set spell spelllang=en_us

  " Rust
  autocmd FileType rust map <S-F10> :w <bar> :!cargo run <CR>
  autocmd FileType rust imap <S-F10> <Esc> :w <bar> :!cargo run<CR>

augroup end

function LatexFunc()
  set spell spelllang=en_us 
  set formatoptions-=cro
  set foldmethod=expr 
  set foldexpr=vimtex#fold#level(v:lnum) 
  set foldtext=vimtex#fold#text()
  map <F5> :w <bar> :VimtexCompile <CR><CR>
  imap <F5> <Esc> :w <bar> :VimtexCompile <CR><CR>
  nnoremap <leader><leader> za 
endfunction
