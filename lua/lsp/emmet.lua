return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		require("lspconfig").emmet_ls.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, false, true, false)
				keymaps.set(bufnr)
			end,
			capabilities = capabilities,
			filetypes = { "html" },
		})
	end,
}
