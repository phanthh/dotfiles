vim.cmd([[
" Coding
function s:coding_spec()
  set number
  set dictionary=
endfunction

function s:repl_spec()
  let g:sendtowindow_use_default=0
  nmap <leader><leader> V<Plug>SendDownV
  xmap <leader><leader> <Plug>SendDownV
endfunction

function s:spec_r()
  nnoremap <s-f9> :vsplit term://R<bar>:wincmd h<cr>
  nnoremap <f9> :split term://R<bar>:wincmd h<cr>
  call s:repl_spec()
endfunction

function s:spec_python()
  nnoremap <s-f9> :vsplit term://prime-run ipython<bar>:wincmd h<cr>
  nnoremap <f9> :split term://prime-run ipython<bar>:wincmd h<cr>
  nnoremap <s-f10> :!jupytext --to notebook %<cr><cr>
  nmap <c-x> <Plug>JupyterExecute
  " call s:repl_spec()
endfunction

function s:spec_rust()
	map <s-f10> :w <bar> :!cargo run <cr>
	imap <s-f10> <esc> :w <bar> :!cargo run<cr>
endfunction 

function s:spec_scala() 
  map <s-f10> :w <bar> :!sbt run <cr>
  map <s-f10> <esc> :w <bar> :!sbt run<cr>
  map <f9> :w <bar> :!sbt test <cr>
  imap <f9> <esc> :w <bar> :!sbt test<>
endfunction

augroup s:coding
  autocmd!
  autocmd FileType rust,scala,python,r,cpp,c,javascript,javascriptreact,typescript,typescriptreact,css,html,lua,sh,dart call s:coding_spec()
  " specific
  autocmd FileType rust call s:spec_rust()
	autocmd FileType scala call s:spec_scala()
	autocmd FileType python call s:spec_python()
	autocmd FileType r call s:spec_r()
  autocmd TermOpen * setlocal nonumber nospell
augroup end

" Writing
function s:writing_spec()
  set noruler noshowcmd nonumber
  nmap <buffer><f12> :GrammarousCheck<cr>
  nmap <buffer><s-f12> :GrammarousReset<cr>
endfunction

function s:spec_tex()
  set foldlevel=99
  set foldmethod=expr 
  set foldexpr=vimtex#fold#level(v:lnum) 
  set foldtext=vimtex#fold#text()
  map <f10> :w <bar> :VimtexCompile<cr>
  imap <f10> <esc>:w<bar>:VimtexCompile<cr>
  nnoremap <leader><leader> za 
endfunction

function s:spec_md()
  " telekasten
  nnoremap <leader>zf :Telekasten find_notes<cr>
  nnoremap <leader>zl :Telekasten insert_link<cr>
  nnoremap <leader>zd :Telekasten find_daily_notes<cr>
  nnoremap <leader>zg :Telekasten search_notes<cr>
  nnoremap <leader>zz :Telekasten follow_link<cr>
  nnoremap <leader>zi :Telekasten paste_img_and_link<cr>
  nnoremap <leader>z :Telekasten panel<cr>
endfunction

function s:spec_rmd()
  syntax on
  call s:spec_r()
  map <f10> :w <bar> :!util_rmdcompile % 'pdf_document'<cr>
  imap <f10> <esc>:w<bar>:!util_rmdcompile % 'pdf_document'<cr>
endfunction

augroup s:writing
  autocmd!
  autocmd FileType tex,markdown,rmd call s:writing_spec()
  autocmd FileType tex call s:spec_tex()
  autocmd FileType markdown call s:spec_md()
  autocmd FileType rmd call s:spec_rmd()
augroup end
]])
