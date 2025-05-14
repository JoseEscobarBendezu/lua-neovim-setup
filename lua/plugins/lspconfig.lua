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

    -- Autopairs
    { 'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
    },

		-- Snippets
		-- { "L3MON4D3/LuaSnip" }, -- Required
		-- { "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
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
        keyword_length = 2,
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
      mapping = cmp.mapping.preset.cmdline({
        ["<A-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<A-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<A-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      }),
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

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			keymap("n", "gp", vim.diagnostic.open_float, opts)
			keymap("n", "pd", vim.diagnostic.goto_prev, opts)
			keymap("n", "nd", vim.diagnostic.goto_next, opts)
			keymap("n", "gh", vim.lsp.buf.hover, bufopts)
			keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
			keymap("n", "gc", vim.lsp.buf.code_action, bufopts)
			keymap("n", "gr", vim.lsp.buf.rename, bufopts)
			keymap("n", "gs", vim.lsp.buf.signature_help, bufopts)
			-- keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
			-- keymap("n", "gd", vim.lsp.buf.definition, bufopts)
			-- keymap("n", "gv", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
			-- keymap("n", "gx", "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
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
				"eslint",
        "intelephense",
			},
		})

    vim.lsp.config('*', {
      on_attach = on_attach,
      capabilities = capabilities,
      root_markers = { '.git' },
    })

    vim.lsp.config('lua_ls',{
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
              globals = {'vim'}
          }
        }
      }
    })

    vim.lsp.config('volar',{
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "vue", "javascript", "typescript" },
      init_options = {
        vue = { hybridMode = false },
        typescript = { tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib" },
      },
    })

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
        "php-cs-fixer",
			},
		})

    vim.diagnostic.config({
      signs = {
          text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.INFO] = "",
              [vim.diagnostic.severity.HINT] = "",
          },
          texthl = {
              [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
              [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
              [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
              [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
          linehl = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "",
              [vim.diagnostic.severity.INFO] = "",
          },
          numhl = {
              [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
              [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
              [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
              [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
      },
    })

		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#36A3D9", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#BF616A", bold = true })

		vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { bg = "#51202A", fg = "#BF616A", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { bg = "#51412A", fg = "#FFA500", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { bg = "#1E535D", fg = "#00FFFF", bold = true })
		vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { bg = "#1E205D", fg = "#0000FF", bold = true })
	end,
}
