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
				mode = 2,
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
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
			-- 	{
			-- 		"tabs",
			-- 		max_length = vim.o.columns / 3,
			-- 		mode = 0,
			-- 	},
		},
	},
})

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
	overrides = {},
	theme = "default", -- Load "default" theme or the experimental "light" theme
})

vim.cmd("colorscheme kanagawa")

-- require("onenord").setup({
-- 	fade_nc = true,
-- 	styles = {
-- 		comments = "italic",
-- 		strings = "NONE",
-- 		keywords = "bold",
-- 		functions = "NONE",
-- 		variables = "NONE",
-- 		diagnostics = "NONE",
-- 	},
-- })

-- require("gruvbox").setup({
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = true,
-- 	italic = true,
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	invert_intend_guides = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })
-- vim.cmd("colorscheme gruvbox")

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#76393E", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#6f5d3c", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#5a7347", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#408a91", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#30666c", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#683f74", nocombine = true })

vim.opt.list = true

require("indent_blankline").setup({
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
})

vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { underline = false })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#C1866B" })

vim.api.nvim_set_hl(0, "DiffText", { bg = "black", fg = "#C1866B", bold = true, underline = false })

-- kanagawa theme telescope
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#1f1f28", bg = "#1f1f28" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1f1f28" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#2e3440", bg = "#88C0D0", bold = true })

vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#2a2a37", bg = "#2a2a37" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#2a2a37" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#2e3440", bg = "#ebcb8b", bold = true })

vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#272734", bg = "#272734" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#272734" })

-- vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#272734", bg = "#272734" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#363646" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#fa9f66", bold = true })

-- kanagawa theme bufferline
vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#1e1f28", bold = true })

-- onenord theme telescope
-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#292e39", bg = "#292e39" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#292e39" })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#2e3440", bg = "#88C0D0", bold = true })
--
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#3b4252", bg = "#3b4252" })
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#3b4252" })
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#2e3440", bg = "#ebcb8b", bold = true })
--
-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#2e3440", bg = "#2e3440" })
-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#2e333f" })

-- onenord theme bufferline
-- vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#2E3440", fg = "#9fa5b3", bold = true })

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

-- kanagawa cmp theme
vim.cmd([[hi Pmenu guibg=#16161d]])
vim.cmd([[hi PmenuSel guibg=#2a2a37]])

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#fa9f66", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { gui = strikethrough, fg = "#808080" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#fa9f66" })

-- onenord cmp theme
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", gui = strikethrough, fg = "#808080" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#569CD6" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "NONE", fg = "#D4D4D4" })

vim.api.nvim_set_hl(0, "GitSignsAddNr", { bg = "#33503d" })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { bg = "#704724" })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { bg = "#833c42" })
vim.api.nvim_set_hl(0, "GitSignsUntrakedNr", { bg = "#2c2f75" })

-- sign define DiagnosticSignError text=🦊 texthl=DiagnosticSignError linehl= numhl=
-- sign define DiagnosticSignWarn text=😤 texthl=DiagnosticSignWarn linehl= numhl=
-- sign define DiagnosticSignInfo text=🧐 texthl=DiagnosticSignInfo linehl= numhl=
-- sign define DiagnosticSignHint text=🐨 texthl=DiagnosticSignHint linehl= numhl=
