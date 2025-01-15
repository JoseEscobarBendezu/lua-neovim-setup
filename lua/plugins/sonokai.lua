return {
	"sainnhe/sonokai",
	-- enabled = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme sonokai")

		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#1f1f28", bg = "#1f1f28" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1f1f28" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#2e3440", bg = "#88C0D0", bold = true })

		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#2a2a37", bg = "#2a2a37" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#2a2a37" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#2e3440", bg = "#ebcb8b", bold = true })

		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#272734", bg = "#272734" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#272734" })

		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#363646" })
		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#fa9f66", bold = true })
	end,
}
