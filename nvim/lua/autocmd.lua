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

augroup auto_format
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" terminal spec
augroup s:term_spec
  autocmd!
  autocmd TermOpen * setlocal nonumber nospell
augroup end
]])
