return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		-- LSP Support
		"williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- linter
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "vue_ls",
        "vtsls",
        "lua_ls",
        "tailwindcss",
        -- "eslint",
      },
    })
    require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
			},
		})
  end,
}
