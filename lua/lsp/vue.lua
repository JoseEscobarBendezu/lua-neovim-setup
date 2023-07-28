--[[ local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local lspconfig_util = require("lspconfig.util")

local function on_new_config(new_config, new_root_dir)
	local function get_typescript_server_path(root_dir)
		local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
		return project_root
				and (lspconfig_util.path.join(project_root, "node_modules", "typescript", "lib", "tsserverlibrary.js"))
   or ""
	end

	if
		new_config.init_options
		and new_config.init_options.typescript
		and new_config.init_options.typescript.serverPath == ""
	then
		new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
	end
end

local volar_cmd = { "vue-language-server", "--stdio" }
local volar_root_dir = lspconfig_util.root_pattern("package.json")
local volar_root_dir = "/home/jose/.local/share/nvim/lsp_servers/volar" ]]
--[[ lspconfig_configs.volar_api = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know)
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
		init_options = {
			typescript = {
				tsdk = "/home/jose/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript/lib",
			},
			languageFeatures = {
				implementation = true, -- new in @volar/vue-language-server v0.33
				references = true,
				definition = true,
				typeDefinition = true,
				callHierarchy = true,
				hover = true,
				rename = true,
				renameFileRefactoring = true,
				signatureHelp = true,
				codeAction = true,
				workspaceSymbol = true,
				completion = {
					defaultTagNameCase = "both",
					defaultAttrNameCase = "kebabCase",
					getDocumentNameCasesRequest = false,
					getDocumentSelectionRequest = false,
				},
			},
		},
	},
} ]]
-- lspconfig.volar_api.setup({})

--[[ lspconfig_configs.volar_doc = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know):
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
		init_options = {
			typescript = {
				tsdk = "/home/jose/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript/lib",
			},
			languageFeatures = {
				implementation = true, -- new in @volar/vue-language-server v0.33
				documentHighlight = true,
				documentLink = true,
				codeLens = { showReferencesNotification = true },
				-- not supported - https://github.com/neovim/neovim/pull/15723
				semanticTokens = false,
				diagnostics = true,
				schemaRequestService = true,
			},
		},
	},
} ]]
-- lspconfig.volar_doc.setup({})

--[[ lspconfig_configs.volar_html = {
	default_config = {
		cmd = volar_cmd,
		root_dir = volar_root_dir,
		on_new_config = on_new_config,
		filetypes = { "vue" },
		-- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
		--filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		init_options = {
			typescript = {
				tsdk = "/home/jose/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript/lib",
			},
			documentFeatures = {
				selectionRange = true,
				foldingRange = true,
				linkedEditingRange = true,
				documentSymbol = true,
				-- not supported - https://github.com/neovim/neovim/pull/13654
				documentColor = false,
				documentFormatting = {
					defaultPrintWidth = 100,
				},
			},
		},
	},
} ]]
-- lspconfig.volar_html.setup({})

local util = require("lspconfig.util")
local function get_typescript_server_path(root_dir)
	local global_ts = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
	-- Alternative location if installed as root:
	-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

return {
	setup = function(keymaps, capabilities, enabled_capabilities)
		-- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
		require("lspconfig").volar.setup({
			on_attach = function(client, bufnr)
				enabled_capabilities(client, false, true, false)
				keymaps.set(bufnr)
			end,
			capabilities = capabilities,
			filetypes = { "vue", "javascript", "typescript" },
			flags = {
				debounce_text_changes = 75,
			},
			on_new_config = function(new_config, new_root_dir)
				new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
			end,
			--[[ init_options = {
				typescript = {
					tsdk = vim.fn.stdpath("data")
						.. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
				},
			}, ]]
		})
	end,
}
