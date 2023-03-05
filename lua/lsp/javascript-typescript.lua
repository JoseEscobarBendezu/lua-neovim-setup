return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		require("lspconfig").tsserver.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, false, true, false)
				local ts_utils = require("nvim-lsp-ts-utils")
				-- https://github.com/Microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
				ts_utils.setup({
					enable_import_on_completion = true,
					filter_out_diagnostics_by_code = {
						1109, --Expression expected.
						1155, -- 'const' declarations must be initialized.
						2305, -- "Module '{0}' has no exported member '{1}'.":
						2307, -- Cannot find module '{0}' or its corresponding type declarations. for vue
						6133, --is declared but its value is never read
						7005, --  "Variable '{0}' implicitly has an '{1}' type."
						80001, -- File is a CommonJS module; it may be converted to an ES module
					},
				})
				ts_utils.setup_client(client)
				-- bufmap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
				-- bufmap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
				-- bufmap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
				keymaps.set(bufnr)
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end,
			capabilities = capabilities,
		})
	end,
}
