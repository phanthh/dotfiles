"==================================================================="
"============================= PLUGINS =============================" 
"===================================================================" 

call plug#begin('~/.config/nvim/plugged') 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' 
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript' 
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'vim-python/python-syntax'
" plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes' 
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'mcchrish/nnn.vim'
Plug 'Chiel92/vim-autoformat'
" Plug 'morhetz/gruvbox' 
Plug 'tomasiser/vim-code-dark'
call plug#end()            


"==================================================================="
"============================= FLAGS ==============================="
"==================================================================="

filetype on
filetype plugin indent on
syntax on
set colorcolumn=80
set clipboard=unnamedplus
set belloff=all
set hidden
set number
set numberwidth=5
set shortmess+=I
set shortmess+=c
set wildmenu
set expandtab
set autoindent 
set backspace=indent,eol,start
set relativenumber
set copyindent
set mouse=a
set ignorecase
set smartcase
set incsearch
set hlsearch
set hidden
set autoread
set timeout timeoutlen=350
set ttimeout ttimeoutlen=350
set history=1000 
set updatetime=250
set laststatus=1
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set t_Co=256
set ttyfast
set shell=/usr/bin/zsh\ -l
set textwidth=80
set fo+=t
set fo-=l
set foldlevel=99
colorscheme codedark
" colorscheme gruvbox
"========================= SAFE GUARD =============================="
set backup
set undolevels=1000
set undofile
if has("nvim")
  set backupdir=~/.local/share/nvim/backup
endif

"==================================================================="
"====================LANGUAGE SPECIFIC FLAGS ======================="
"==================================================================="

" LATEX 
autocmd FileType * set formatoptions-=cro
autocmd FileType tex set spell spelllang=en_us
autocmd FileType tex set foldmethod=expr 
autocmd FileType tex set foldexpr=vimtex#fold#level(v:lnum) 
autocmd FileType tex set foldtext=vimtex#fold#text()
" autocmd FileType tex,cpp au BufWrite * :Autoformat<CR>
autocmd FileType markdown set spell spelllang=en_us

" CPP
autocmd FileType cpp,c let b:coc_pairs_disabled = ['<']


"==================================================================="
"============================= COCNVIM =============================" 
"===================================================================" 

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

"==================================================================="
"========================= KEY BINDING ============================="
"==================================================================="

" LEADER
nnoremap <SPACE> <Nop>
let mapleader=" "

" QUICK
" ZZ : Save and quit
" ZQ : Save without quit

nnoremap <TAB> :nohl<CR>

" ESC
inoremap jj <Esc>
nnoremap <F12> :source ~/.vimrc<CR>

" PANE
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> <leader>w :vsplit <bar> wincmd l<CR>
nmap <silent> <leader>v :split <bar> wincmd j<CR> " TAB nmap <silent> <leader>p :tabn<CR>
nmap <silent> <leader>n :tabp<CR>
nmap <silent> <leader>t :tabnew<CR>

" NERDTREE
nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeFocus<CR>R<CR>

" SEARCH
nmap <silent> <leader>o :GFiles<CR>

" EXECUTE
autocmd FileType rust map <F5> :w <bar> :!rustc % && ./%< <CR>
autocmd FileType rust imap <F5> <Esc> :w <bar> :!rustc % && ./%< <CR>
autocmd FileType cpp map <F5> :w <bar> :!g++ % -o %< && ./%< <CR>
autocmd FileType cpp imap <F5> <Esc> :w <bar> :!g++ % -o %< && ./%< <CR>
autocmd FileType python nmap <F5> :CocCommand python.execInTerminal <CR>
autocmd FileType python imap <F5> <Esc> :CocCommand python.execInTerminal <CR>

" LATEX 
autocmd FileType tex map <F5> :w <bar> :VimtexCompile <CR><CR>
autocmd FileType tex imap <F5> <Esc> :w <bar> :VimtexCompile <CR><CR>
autocmd FileType tex nnoremap <leader><leader> za 

" EASY ALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"==================================================================="
"========================= PLUGINS CONFIG =========================="
"==================================================================="



" NERDTREE CONFIG
let NERDTreeIgnore = ['\.pyc$', 'node_modules']
let NERDTreeMapActivateNode='l'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" PYTHON HIGHLIGHT
let g:python_highlight_all = 1 

" CURSOR
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

" TMUX
" let g:tmux_navigator_no_mappings = 1

" LATEX
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_enabled = 0
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" PYTHON NVIM
let g:python3_host_prog='/usr/bin/python'

" GVIM
" set guioptions=
" set guioptions+=c
set guifont=Consolas:h20:cANSI

" AIRLINE
" let g:airline#extensions#fzf#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline_symbols = {}
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = 'L'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.dirty=''
" let g:airline_theme = 'gruvbox'
" let g:airline_mode_map = {
"     \ '__'     : '-',
"     \ 'c'      : 'C',
"     \ 'i'      : 'I',
"     \ 'ic'     : 'I',
"     \ 'ix'     : 'I',
"     \ 'n'      : 'N',
"     \ 'multi'  : 'M',
"     \ 'ni'     : 'N',
"     \ 'no'     : 'N',
"     \ 'R'      : 'R',
"     \ 'Rv'     : 'R',
"     \ 's'      : 'S',
"     \ 'S'      : 'S',
"     \ ''     : 'S',
"     \ 't'      : 'T',
"     \ 'v'      : 'V',
"     \ 'V'      : 'V',
"     \ ''     : 'V',
"     \ }

" WSL
" let s:clip = '/mnt/c/Windows/System32/clip.exe'
" if executable(s:clip)
"   augroup WSLYank
"     autocmd!
"     autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"   augroup END
" endif

" NNN
" let g:nnn#set_default_mappings = 0
" nnoremap <leader>c :NnnPicker '%:p:h'<CR>
" " Opens the nnn window in a split
" let g:nnn#layout = 'new' " or vnew, tabnew etc.

" " Or pass a dictionary with window size
" let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" " Floating window (neovim latest and vim with patch 8.2.191)
" let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" let g:nnn#command = 'nnn -d'

