local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	"jsonls",
	"intelephense",
	"html",
	"emmet_ls",
	"sumneko_lua",
	"tsserver",
	"volar",
	"cssls",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local keymaps = require("keymaps/lsp_keymaps")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local enable_capabilities = function(client, formatting, diagnostic, rangformatting)
	if vim.fn.has("nvim-0.8") == 1 then
		client.server_capabilities.documentFormattingProvider = formatting
		client.server_capabilities.document_diagnostics = diagnostic
		client.server_capabilities.documentRangeFormattingProvider = rangformatting
	else
		client.resolved_capabilities.document_formatting = formatting
		client.resolved_capabilities.document_diagnostics = diagnostic
		client.resolved_capabilities.document_range_formatting = rangformatting
	end
end

local ts_config = function(client)
	local ts_utils = require("nvim-lsp-ts-utils")
	-- https://github.com/Microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
	ts_utils.setup({
		enable_import_on_completion = true,
		filter_out_diagnostics_by_code = {
			6133, --is declared but its value is never read
			1109, --Expression expected.
			1155, -- 'const' declarations must be initialized.
			1155, -- 'const' declarations must be initialized.
			80001, -- File is a CommonJS module; it may be converted to an ES module
		},
	})
	ts_utils.setup_client(client)
	-- bufmap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
	-- bufmap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	-- bufmap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		enable_capabilities(client, false, true, false)
		ts_config(client)
	end
	if client.name == "volar" then
		enable_capabilities(client, true, true, false)
	end
	if client.name == "sumneko_lua" then
		enable_capabilities(client, false, true, false)
	end
	if client.name == "cssls" then
		enable_capabilities(client, true, true, true)
	end
	if client.name == "intelephense" then
		enable_capabilities(client, true, true, true)
	end
	-- if client.name == "stylelint_lsp" then
	-- 	enable_capabilities(client, true, true, true)
	-- end
	keymaps.set(bufnr)

	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			if vim.fn.has("nvim-0.8") == 1 then
				vim.lsp.buf.format({ bufnr = bufnr })
			else
				vim.lsp.buf.formatting_sync()
			end
		end,
	})
end

for _, server in ipairs(servers) do
	local config = {}
	if server == "sumneko_lua" then
		config.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	end
	if server == "emmet_ls" then
		config.filetypes = { "html" }
	end
	if server == "stylelint_lsp" then
		config.filetypes = { "css" }
		config.settings = {
			stylelintplus = {
				autoFixOnSave = true,
				autoFixOnFormat = true,
				-- configFile = "/home/Jose/Personal/Configuraciones/linter/.stylelintrc.json",
				-- see available options in stylelint-lsp documentation
			},
		}
	end
	if server == "volar" then
		config.root_dir = util.root_pattern("package.json", "vue.config.js")
		config.filetypes = { "vue" }
		config.init_options = {
			typescript = {
				tsdk = "/home/Jose/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript/lib",
			},
			languageFeatures = {
				references = true,
				definition = true,
				typeDefinition = true,
				callHierarchy = true,
				hover = true,
				rename = true,
				signatureHelp = true,
				codeAction = true,
				completion = {
					defaultTagNameCase = "both",
					defaultAttrNameCase = "kebabCase",
				},
				documentLink = true,
				codeLens = true,
				diagnostics = true,
			},
			documentFeatures = {
				selectionRange = true,
				foldingRange = true,
				documentSymbol = true,
				documentColor = true,
				documentFormatting = {
					defaultPrintWidth = 100,
					getDocumentPrintWidthRequest = true,
				},
			},
		}
		config.settings = {
			volar = {
				codeLens = {
					references = true,
					pugTools = true,
					scriptSetupTools = true,
				},
			},
		}
	end
	if server == "jsonls" then
		config.settings = {
			files = {
				associations = {
					myfile = {
						json = "jsonc",
					},
				},
			},
		}
	end
	config.on_attach = on_attach
	config.capabilities = capabilities
	config.lsp_flag = lsp_flags
	lspconfig[server].setup(config)
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
