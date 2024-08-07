local icons = {
	Text = "󰦨",
	Method = "",
	Function = "󰊕",
	Constructor = "⌘",
	Field = "ﰠ",
	Variable = "󱀍",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP Support
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- linter

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional
		{ "hrsh7th/cmp-cmdline" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		-- { "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			keymap("n", "gp", vim.diagnostic.open_float, opts)
			keymap("n", "pd", vim.diagnostic.goto_prev, opts)
			keymap("n", "nd", vim.diagnostic.goto_next, opts)
			keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
			keymap("n", "gh", vim.lsp.buf.hover, bufopts)
			--keymap("n", "gd", vim.lsp.buf.definition, bufopts)
			keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
			keymap("n", "gc", vim.lsp.buf.code_action, bufopts)
			keymap("n", "gr", vim.lsp.buf.rename, bufopts)
			keymap("n", "gv", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
			keymap("n", "gx", "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
			keymap("n", "gq", vim.lsp.buf.signature_help, bufopts)
		end

		local mason = require("mason")
		mason.setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- "tsserver",
				"volar",
				"cssls",
				"tailwindcss",
				"html",
				"lua_ls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
					})
				end,
				volar = function()
					lspconfig.volar.setup({
						filetypes = { "vue", "javascript", "typescript" },
						init_options = {
							vue = { hybridMode = false },
							typescript = { tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib" },
						},
					})
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
			},
		})

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<A-e>"] = cmp.mapping.close(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<A-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<A-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}, {
				{ name = "buffer" },
			}),
			completion = {
				completeopt = "menu,menuone,noinsert",
				keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
				keyword_length = 1,
			},
			formatting = {
				fields = { "kind", "abbr" },
				format = function(_, vim_item)
					vim_item.menu = vim_item.kind
					vim_item.kind = " " .. (icons[vim_item.kind] or "") .. " "

					return vim_item
				end,
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		vim.fn.sign_define(
			"DiagnosticSignError",
			{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticLineNrError" }
		)
		vim.fn.sign_define(
			"DiagnosticSignWarn",
			{ text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "DiagnosticLineNrWarn" }
		)
		vim.fn.sign_define(
			"DiagnosticSignInfo",
			{ text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "DiagnosticLineNrInfo" }
		)
		vim.fn.sign_define(
			"DiagnosticSignHint",
			{ text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "DiagnosticLineNrHint" }
		)

		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#36A3D9", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#BF616A", bold = true })

		vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { bg = "#51202A", fg = "#BF616A", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { bg = "#51412A", fg = "#FFA500", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { bg = "#1E535D", fg = "#00FFFF", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { bg = "#1E205D", fg = "#0000FF", bold = true })
	end,
}
