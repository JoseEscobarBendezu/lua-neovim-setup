return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		require("lspconfig").cssls.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, false, true, false)
				keymaps.set(bufnr)
			end,
			capabilities = capabilities,
		})
	end,
}
