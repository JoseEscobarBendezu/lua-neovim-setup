return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    require("conform").setup({
      formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          vue = { { "prettierd", "prettier" } },
          css = { { "prettierd", "prettier" } },
          html = { { "prettierd", "prettier" } },
          json = { { "prettierd", "prettier" } },
          markdown = { { "prettierd", "prettier" } },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      }
    })
  end
}
