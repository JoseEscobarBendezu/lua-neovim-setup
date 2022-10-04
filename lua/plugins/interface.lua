require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "%=", "filename" },
		lualine_x = { "diagnostics" },
		lualine_y = { "diff", "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = true, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.
				mode = 0,
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- it can also be a function that returns
				-- the value of `max_length` dynamically.
				filetype_names = {
					TelescopePrompt = "Telescope",
					dashboard = "",
					packer = "Packer",
					fzf = "FZF",
					alpha = "Alpha",
					NvimTree = "NvimTree",
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
				buffers_color = {
					-- Same values as the general color option can be used here.
					active = "lualine_b_normal", -- Color for active buffer.
					inactive = "lualine_b_inactive", -- Color for inactive buffer.
				},
				icons_enabled = true,
				separator = nil,
				symbols = {
					modified = " ﴖ", -- Text to show when the buffer is modified
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				"tabs",
				max_length = vim.o.columns / 3,
				mode = 0,
			},
		},
	},
	extensions = { "nvim-tree" },
})

require("onenord").setup({
	fade_nc = true,
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "bold",
		functions = "NONE",
		variables = "NONE",
		diagnostics = "NONE",
	},
})

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#76393E", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#6f5d3c", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#5a7347", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#30666c", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#683f74", nocombine = true })

vim.opt.list = true

require("indent_blankline").setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})

vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#292e39", bg = "#292e39" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = "#292e39", bg = "#292e39" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#2e3440", bg = "#88C0D0", bold = true })

vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#3b4252", bg = "#3b4252" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#3b4252", fg = "#C8D0E0" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#2e3440", bg = "#ebcb8b", bold = true })

vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#2e333f", bg = "#2e3440" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#2e333f", fg = "#C8D0E0" })

vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#2E3440", fg = "#9fa5b3", bold = true })

vim.api.nvim_set_hl(0, "TabLine", { cterm = underline, ctermfg = 15, ctermbg = 242, fg = "#6C7A96", bg = "red" })
vim.api.nvim_set_hl(0, "TabLineFill", { cterm = reverse, fg = "#6C7A96", bg = "red" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = NONE, strikethrough = true, fg = "#808080" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = NONE, fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = NONE, fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = NONE, fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = NONE, fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = NONE, fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = NONE, fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = NONE, fg = "#D4D4D4" })

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

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = NONE, gui = strikethrough, fg = "#808080" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = NONE, fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = NONE, fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = NONE, fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = NONE, fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = NONE, fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = NONE, fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = NONE, fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = NONE, fg = "#D4D4D4" })

-- sign define DiagnosticSignError text=🦊 texthl=DiagnosticSignError linehl= numhl=
-- sign define DiagnosticSignWarn text=😤 texthl=DiagnosticSignWarn linehl= numhl=
-- sign define DiagnosticSignInfo text=🧐 texthl=DiagnosticSignInfo linehl= numhl=
-- sign define DiagnosticSignHint text=🐨 texthl=DiagnosticSignHint linehl= numhl=
