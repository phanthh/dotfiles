vim.cmd([[
" auto compile packer
augroup packer_user_config
  autocmd!
  autocmd BufWritePost pluginList.lua PackerCompile
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
