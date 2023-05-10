local lsp_servers = {
	"lua",
	"javascript-typescript",
	"css",
	"html",
	"emmet",
	"json",
	"tailwind",
	"php",
	"vue",
}

local mason_servers = {
	"css-lsp",
	"emmet-ls",
	"html-lsp",
	"intelephense",
	"json-lsp",
	"lua-language-server",
	"tailwindcss-language-server",
	"typescript-language-server",
	"vue-language-server",
}

require("mason-tool-installer").setup({
	ensure_installed = mason_servers,
})

local keymaps = require("keymaps/lsp_keymaps")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local enable_capabilities = function(client, formatting, diagnostic, rangformatting)
	client.server_capabilities.documentFormattingProvider = formatting
	client.server_capabilities.document_diagnostics = diagnostic
	client.server_capabilities.documentRangeFormattingProvider = rangformatting
end

local on_attach = function(client, bufnr)
	keymaps.set(bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

for _, server in pairs(lsp_servers) do
	local server_config_ok, language = pcall(require, "lsp." .. server)
	if server_config_ok == false then
		print("Error en el server " .. server)
	else
		language.setup(keymaps, capabilities, enable_capabilities)
	end
end

vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
})

--formatting and diagnostics
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
local code_action = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		formatting.eslint_d.with({
			-- disabled_filetypes = { "vue" },
		}),
		code_action.eslint_d.with({
			-- disabled_filetypes = { "vue" },
		}),
		diagnostic.eslint_d.with({
			-- disabled_filetypes = { "vue" },
		}),
		formatting.stylua,
	},
	on_attach = on_attach,
})

require("mason").setup()

require("mason-null-ls").setup({
	automatic_installation = true,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, ...)
	local client = vim.lsp.get_client_by_id(ctx.client_id)

	if client and client.name == "volar" then
		result.diagnostics = vim.tbl_filter(function(diagnostic)
			-- use whatever condition you want to filter diagnostics or document type
			-- print(diagnostic.source)
			-- diagnostic.document:find("ts", 1, true)
			return not (
				diagnostic.message:find("is declared but its value is never read")
				or diagnostic.message:find("Cannot find name")
				or diagnostic.message:find("Attribute name cannot contain")
			)
			-- or diagnostic.message:find("does not exist on type")			-- or diagnostic.message:find("is not a module")
			--or diagnostic.message:find("or its corresponding type declarations")
			-- or diagnostic.message:find("only refers to a type, but is being used as a value here")
		end, result.diagnostics)
	end

	return vim.lsp.diagnostic.on_publish_diagnostics(nil, result, ctx, ...)
end
