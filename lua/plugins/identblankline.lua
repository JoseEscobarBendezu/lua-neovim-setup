return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		main = "ibl",
		opts = {
			filetype_exclude = {
				"NvimTree",
				"TelescopePrompt",
				"TelescopeResults",
				"alpha",
				"help",
				"lspinfo",
				"mason.nvim",
				"nvchad_cheatsheet",
				"packer",
				"terminal",
				"Trouble",
				"",
			},
			space_char_blankline = " ",
			show_current_context = true,
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},
		},
		config = function()
			local highlight = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#76393E", nocombine = true })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#6f5d3c", nocombine = true })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#5a7347", nocombine = true })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#408a91", nocombine = true })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#30666c", nocombine = true })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#683f74", nocombine = true })
			end)

			require("ibl").setup({
				scope = {
					enabled = false,
					show_start = false,
					show_end = false,
				},
				indent = { highlight = highlight },
			})
		end,
	},
}
