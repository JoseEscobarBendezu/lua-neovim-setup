return {
	"Mofiqul/dracula.nvim",
	enabled = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme dracula-soft")

		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#313338" })
		vim.api.nvim_set_hl(0, "@variable", { fg = "#d9d9d9" })

		-- dracula theme
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = "#d9d9d9", bg = "#272734" })
	end,
}
