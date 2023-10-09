return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function ()
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
    vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#658594", fg = "#2A2A37", bold = true })
    vim.api.nvim_set_hl(0, "lualine_a_buffers_inactive", { bg = "#2A2A37", fg = "#D4D4D4" })

	end,
}

