return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Linter and formatting
    { "williamboman/mason.nvim" },
    { "nvimtools/none-ls.nvim" },
    { "nvimtools/none-ls-extras.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "eslint_d", "prettierd" }
    })

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.prettierd,
        -- require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
      },
    })
  end,
}
