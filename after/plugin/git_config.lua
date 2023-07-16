local keymaps = require("configurations.keymaps")
local utils = require("configurations.utils")

-- git_diff keymaps
local git_diff = keymaps.git_diff
utils.set_keymap_config(git_diff)

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsUntrakedNr", linehl = "GitSignsUntrakedLn" },
	},
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
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
		border = "none",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	--[[ keymaps = {
		noremap = true,
		["n <leader>gp"] = '<cmd> lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>gi"] = '<cmd> lua require"gitsigns".blame_line()<CR>',
		["n pc"] = { expr = true, "&diff ? '[c' : '<cmd> lua require\"gitsigns\".prev_hunk()<CR>'" },
		["n nc"] = { expr = true, "&diff ? ']c' : '<cmd> lua require\"gitsigns\".next_hunk()<CR>'" },
		-- ['n ghr'] = '<cmd> lua require"gitsigns".toggle_deleted()<CR>',
	}, ]]
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "nc", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "pc", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		-- map("n", "<leader>hs", gs.stage_hunk)
		-- map("n", "<leader>hr", gs.reset_hunk)
		--[[ map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end) ]]
		--[[ map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end) ]]
		-- map("n", "<leader>hS", gs.stage_buffer)
		-- map("n", "<leader>hu", gs.undo_stage_hunk)
		-- map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>gp", gs.preview_hunk)
		map("n", "<leader>gi", function()
			gs.blame_line({ full = true })
		end)
		-- map("n", "<leader>tb", gs.toggle_current_line_blame)
		-- map("n", "<leader>hd", gs.diffthis)
		--[[ map("n", "<leader>hD", function()
			gs.diffthis("~")
		end) ]]
		-- map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

vim.cmd([[nnoremap <expr> nc &diff ? ']c' : '[c']])
vim.cmd([[nnoremap <expr> pc &diff ? '[c' : ']c']])

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
			["<leader>dn"] = actions.conflict_choose("none"), -- Delete the conflict region
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
		view_closed = function()
			-- Enable indentation guides when close diffview
			require("indent_blankline.commands").enable()
		end,
	},
})
