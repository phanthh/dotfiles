vim.cmd([[
" auto compile packer
augroup packer_user_config
  autocmd!
  autocmd BufWritePost pluginList.lua source <afile> | PackerCompile | LuaCacheClear | set nospell
augroup end

" auto compile rmarkdown, tex to pdf
function s:rmd_pdf()
  call jobstart(['util_rmdcompile', expand('%:p'), 'pdf_document'])
endfunction

let b:pdfcompile=0
augroup pdf_compile 
  autocmd!
  autocmd BufWritePost *.rmd,*.Rmd if b:pdfcompile == 1 | call s:rmd_pdf()
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
