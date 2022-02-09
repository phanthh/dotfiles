vim.cmd([[
" auto compile packer
augroup packer_user_config
  autocmd!
  autocmd BufWritePost pluginList.lua,ft.lua source <afile> | PackerCompile | LuaCacheClear
augroup end

" auto compile rmarkdown to pdf
function s:rmd_pdf()
  call jobstart(['util_rmdcompile', expand('%:p'), 'pdf_document'])
endfunction

let b:pdfcompile=0
augroup pdf_compile 
  autocmd!
  autocmd BufWritePost *.rmd,*.Rmd if b:pdfcompile == 1 | call s:rmd_pdf()
augroup end

" terminal spec
augroup s:term_spec
  autocmd!
  autocmd TermOpen * setlocal nonumber nospell
augroup end

" filetype spec
augroup s:ft_spec
  autocmd!
  autocmd Filetype zsh,fstab,help,rmd,tmux syntax on
augroup end

" auto read
augroup autoread
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup end
]])
