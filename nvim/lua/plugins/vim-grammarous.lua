vim.g["grammarous#languagetool_cmd"] = "/usr/bin/languagetool"
vim.g["grammarous#disabled_rules"] = {
	tex = { "UNIT_SPACE", "EN_UNPAIRED_BRACKETS" },
}
vim.g["grammarous#disabled_categories"] = {
	tex = { "TYPOS", "TYPOGRAPHY" },
}

vim.cmd([[
  let g:grammarous#hooks = {}
  function! g:grammarous#hooks.on_check(errs) abort
      nmap <buffer><c-n> <Plug>(grammarous-move-to-next-error)
      nmap <buffer><c-p> <Plug>(grammarous-move-to-previous-error)
      nmap <buffer><f7> <Plug>(grammarous-disable-rule)
      nmap <buffer><f8> <Plug>(grammarous-disable-category)
  endfunction

  function! g:grammarous#hooks.on_reset(errs) abort
      nunmap <buffer><c-n>
      nunmap <buffer><c-p>
      nunmap <buffer><f7>
      nunmap <buffer><f8>
  endfunction
]])
