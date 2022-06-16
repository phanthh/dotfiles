local function config(client, bufnr)
	local ts_utils = require("nvim-lsp-ts-utils")

	ts_utils.setup({
		enable_import_on_completion = true,
		import_all_scan_buffers = 100,
		import_all_select_source = false,
		auto_inlay_hints = false,
		update_imports_on_move = true,
		require_confirmation_on_move = true,
	})

	ts_utils.setup_client(client)

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
end

return { config = config }
