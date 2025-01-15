return {
	"rebelot/kanagawa.nvim",
	enabled = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			variablebuiltinStyle = { italic = true },
			specialReturn = true, -- special highlight for the return keyword
			specialException = true, -- special highlight for exception handling keywords
			transparent = false, -- do not set background color
			dimInactive = true, -- dim inactive window `:h hl-NormalNC`
			globalStatus = false, -- adjust window separators highlight for laststatus=3
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = {},
			theme = "default", -- Load "default" theme or the experimental "light" theme
		})
		vim.cmd("colorscheme kanagawa")

		-- kanagawa theme telescope
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#1f1f28", bg = "#1f1f28" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1f1f28" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#2e3440", bg = "#88C0D0", bold = true })

		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#2a2a37", bg = "#2a2a37" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#2a2a37" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#2e3440", bg = "#ebcb8b", bold = true })

		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#272734", bg = "#272734" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#272734" })

		-- kanagawa theme bufferline
		vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#658594", fg = "#2A2A37", bold = true })
		vim.api.nvim_set_hl(0, "lualine_a_buffers_inactive", { bg = "#2A2A37", fg = "#D4D4D4" })
	end,
}
