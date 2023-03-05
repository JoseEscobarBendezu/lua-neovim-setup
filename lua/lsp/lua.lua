return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		require("lspconfig").lua_ls.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, true, true, false)
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
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"nnoremap",
							"vnoremap",
							"inoremap",
							"tnoremap",
							"use",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						-- checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			},
		})
	end,
}
