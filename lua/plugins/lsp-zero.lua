local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "⌘",
  Field = "ﰠ",
  Variable = "",
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
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.preset({
      name = 'minimal',
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    lsp_zero.on_attach(function(client, bufnr)
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      keymap("n", "gp", vim.diagnostic.open_float, opts)
      keymap("n", "pd", vim.diagnostic.goto_prev, opts)
      keymap("n", "nd", vim.diagnostic.goto_next, opts)
      keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
      keymap("n", "gh", vim.lsp.buf.hover, bufopts)
      keymap("n", "gd", vim.lsp.buf.definition, bufopts)
      keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
      keymap("n", "gc", vim.lsp.buf.code_action, bufopts)
      keymap("n", "gr", vim.lsp.buf.rename, bufopts)
      keymap("n", "gv", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
      keymap("n", "gx", "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
      keymap('n', 'gq', vim.lsp.buf.signature_help, bufopts)
    end)

    lsp_zero.ensure_installed({
      'cssls',
      'tailwindcss',
      'html',
      'tsserver',
      'lua_ls',
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'volar' },
      handlers = {
        lsp_zero.default_setup,
        volar = function()
          require('lspconfig').volar.setup({
            on_attach = function(client)
              pcall(function() client.resolved_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true end)
            end,
          })
        end,
      },
    })

    lsp_zero.setup()

    local cmp = require 'cmp'

    cmp.setup({
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
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
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
