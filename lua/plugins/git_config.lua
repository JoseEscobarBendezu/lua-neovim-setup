require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = false,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = true,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	keymaps = {
		noremap = true,
		["n <leader>p"] = '<cmd> lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>i"] = '<cmd> lua require"gitsigns".blame_line()<CR>',
		["n ]c"] = { expr = true, "&diff ? '[c' : '<cmd> lua require\"gitsigns\".prev_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? ']c' : '<cmd> lua require\"gitsigns\".next_hunk()<CR>'" },
		-- ['n ghr'] = '<cmd> lua require"gitsigns".toggle_deleted()<CR>',
	},
})

vim.cmd([[nnoremap <expr> [c &diff ? ']c' : '[c']])
vim.cmd([[nnoremap <expr> ]c &diff ? '[c' : ']c']])

vim.cmd([[nnoremap <expr> [\[ &diff ? '<nop>' : '[\[' ]])
vim.cmd([[nnoremap <expr> ]\] &diff ? '<nop>' : ']\]' ]])

local actions = require("diffview.actions")

require("diffview").setup({
	view = {
		merge_tool = {
			layout = "diff3_mixed",
			disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
		},
	},
	keymaps = {
		view = {
			["<leader>co"] = actions.conflict_choose("ours"), -- Choose the OURS version of a conflict
			["<leader>ct"] = actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
			["<leader>cb"] = actions.conflict_choose("base"), -- Choose the BASE version of a conflict
			["<leader>ca"] = actions.conflict_choose("all"), -- Choose all the versions of a conflict
			["dx"] = actions.conflict_choose("none"), -- Delete the conflict region
		},
	},
	hooks = {
		diff_buf_win_enter = function()
			-- Turn off line wrapping and list chars and relative numbers
			vim.opt_local.wrap = false
			vim.opt_local.list = false
			vim.opt_local.relativenumber = false

			-- Disable indentation guides
			require("indent_blankline.commands").disable()
		end,
	},
})
