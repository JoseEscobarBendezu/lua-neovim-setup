local telescope = require("telescope")

local utils = require("configurations.utils")
local keymaps = require("configurations.keymaps")

--delete default keymaps
local telescope_keymaps = keymaps.telescope
utils.set_keymap_config(telescope_keymaps)

vim.g.theme_switcher_loaded = true

telescope.setup({
	picker = {
		hidden = false,
	},
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").close,
			},
			n = {
				["<C-q>"] = require("telescope.actions").close,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		preview = {
			-- treesitter = false,
		},
		prompt_prefix = " 🔍 ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- file_previewer = require("telescope.previewers").cat.new,
		-- grep_previewer = require("telescope.previewers").vimgrep.new,
		-- qflist_previewer = require("telescope.previewers").qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		results_title = "",
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

-- https://github.com/nvim-telescope/telescope.nvim/pull/1653

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
