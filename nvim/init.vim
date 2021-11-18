"============================="
call plug#begin('~/.config/nvim/plugged') 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set nocompatible
filetype plugin on
syntax on
set updatetime=300
set encoding=utf-8
set hidden
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
" File
set laststatus=1
set formatoptions+=t
set formatoptions-=l
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

if !has('nvim') 
	set viminfofile=~/.vim/viminfo
endif

let mapleader=" "
"============================="
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
"============================="
inoremap jj <Esc>:w<cr>
inoremap jk <Esc>:w<cr>
inoremap <C-H> <C-w>
nmap <silent> <Tab> :nohl<CR>
nmap <silent> <C-w><Up> :wincmd +<CR>
nmap <silent> <C-w><Down> :wincmd -<CR>
nmap <silent> <C-w><Left> :wincmd <<CR>
nmap <silent> <C-w><Right> :wincmd ><CR>
nmap <F10> :w <bar> :!crun %<CR>
imap <F10> <Esc> :w <bar> :!crun %<CR>
nmap <F12> :LanguageToolCheck<CR>
nmap <S-F12> :LanguageToolClear<CR>
"============================="
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"============================="
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_syntax_enabled = 0

set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_enabled = 1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

"============================="
function Latex()
  set spell spelllang=en_us 
  set formatoptions-=cro
  set foldmethod=expr 
  set foldexpr=vimtex#fold#level(v:lnum) 
  set foldtext=vimtex#fold#text()
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

augroup LangSpecs
  autocmd!
  " Latex
  autocmd FileType tex call Latex()
  " Markdown
  autocmd FileType markdown call Markdown()
  " Txt
  autocmd FileType text set spell spelllang=en_us
  " Rust
  autocmd FileType rust call Rust()
  " Scala
	autocmd FileType scala call Scala()
augroup end

"============================="
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup end
"============================="
let g:languagetool_cmd='/usr/bin/languagetool'
