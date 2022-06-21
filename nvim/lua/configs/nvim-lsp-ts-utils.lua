local function config(client, bufnr)
	local ts_utils = require("nvim-lsp-ts-utils")
	local kmb = require("utils").keymap_buf

	ts_utils.setup({
		enable_import_on_completion = true,
		import_all_scan_buffers = 100,
		import_all_select_source = false,
		auto_inlay_hints = false,
		update_imports_on_move = true,
		require_confirmation_on_move = true,
	})

	ts_utils.setup_client(client)

	kmb(bufnr, "n", "gs", ":TSLspOrganize<CR>")
	kmb(bufnr, "n", "gr", ":TSLspRenameFile<CR>")
	kmb(bufnr, "n", "gi", ":TSLspImportAll<CR>")
end

return { config = config }
