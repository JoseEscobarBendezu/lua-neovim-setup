return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		require("lspconfig").tailwindcss.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, true, true, true)
				keymaps.set(bufnr)
			end,
			capabilities = capabilities,
		})
	end,
}
