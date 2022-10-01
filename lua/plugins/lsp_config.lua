-- Include the servers you want to have installed by default below
local servers = {
  'jsonls',
  'intelephense',
  'html',
  'cssls',
  'volar',
  'sumneko_lua',
  'tsserver',
  'vimls',
}

--set laguaje servers
require("nvim-lsp-installer").setup {
  ensure_installed = servers
}

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set
local bufmap = vim.api.nvim_buf_set_keymap

local keymaps = function(bufnr)
  keymap('n', 'gp', vim.diagnostic.open_float, opts)
  keymap('n', ']d', vim.diagnostic.goto_prev, opts)
  keymap('n', '[d', vim.diagnostic.goto_next, opts)
  bufmap(bufnr, 'n', 'gr', vim.lsp.buf.rename, opts)
  bufmap(bufnr, 'n', 'gi', vim.lsp.buf.implementation, opts)
  bufmap(bufnr, 'n', 'gh', vim.lsp.buf.hover, opts)
  bufmap(bufnr, 'n', 'gd', vim.lsp.buf.definition, opts)
  bufmap(bufnr, 'n', 'gv', '<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufmap(bufnr, 'n', 'gx', '<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufmap(bufnr, 'n', 'gt', '<cmd>tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufmap(bufnr, 'n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- bufmap(bufnr, 'n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', opts)
end

local on_attach = function(client, bufnr)
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    -- https://github.com/Microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
    ts_utils.setup({
      enable_import_on_completion = true,
      filter_out_diagnostics_by_code = {
        6133, --is declared but its value is never read
        1109, --Expression expected.
        1155 -- 'const' declarations must be initialized.
      },
    })
    ts_utils.setup_client(client)
    bufmap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    -- bufmap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    -- bufmap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
  end
  if client.name == 'volar' then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_diagnostics = false
    client.resolved_capabilities.document_range_formatting = false
  end
  keymaps(bufnr)
  vim.cmd([[
    augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    augroup END
  ]])
end

-- Setup lspconfig.
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      format = {
        enable = false
      },
      diagnostics = {
        globals = { "vim" },
      },
    }
  },
}

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})

--formatting and diagnostics
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = true,
  sources = {
    formatting.eslint_d,
    code_actions.eslint_d,
    diagnostics.eslint_d,
  },
  on_attach = on_attach,
})
