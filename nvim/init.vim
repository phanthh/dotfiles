"============================="
call plug#begin('~/.config/nvim/plugged') 
Plug 'tomasiser/vim-code-dark'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
call plug#end()            
"============================="
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
set autoindent 
set backspace=indent,eol,start
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2

" Mouse
set mouse=a

" File
" set autoread
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

"============================="
inoremap jj <Esc>:w<cr>
inoremap jk <Esc>:w<cr>
inoremap <C-H> <C-w>
nmap <silent> <C-w><Up> :wincmd +<CR>
nmap <silent> <C-w><Down> :wincmd -<CR>
nmap <silent> <C-w><Left> :wincmd <<CR>
nmap <silent> <C-w><Right> :wincmd ><CR>

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
  map <F5> :w <bar> :VimtexCompile <CR><CR>
  imap <F5> <Esc> :w <bar> :VimtexCompile <CR><CR>
  nnoremap <leader><leader> za 
endfunction

function Markdown()
	set spell spelllang=en_us
endfunction

function Rust()
	map <F11> :w <bar> :!cargo run <CR>
	imap <F11> <Esc> :w <bar> :!cargo run<CR>
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
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
					\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

"============================="
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"============================="
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup end

