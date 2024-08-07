return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = false, -- Toggle with `:Gitsigns toggle_signs` default true
			numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 100,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame` default false
			current_line_blame_opts = {
				virt_text = false,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "none", -- default 'single'
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			--[[ yadm = {
				enable = false,
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
				map("n", "<leader>gp", gs.preview_hunk)
				map("n", "<leader>gi", function()
					gs.blame_line({ full = true })
				end)
			end,
		})

		vim.api.nvim_set_hl(0, "GitSignsAddNr", { bg = "#33503d" })
		vim.api.nvim_set_hl(0, "GitSignsChangeNr", { bg = "#704724" })
		vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { bg = "#833c42" })
		vim.api.nvim_set_hl(0, "GitSignsUntrakedNr", { bg = "#2c2f75" })
	end,
}
