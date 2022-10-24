local telescope = require("telescope")

vim.g.theme_switcher_loaded = true

-- local open_in_nvim_tree = function(prompt_bufnr)
--   local action_state = require "telescope.actions.state"
--   local Path = require "plenary.path"
--   local actions = require "telescope.actions"
--
--   local entry = action_state.get_selected_entry()[1]
--   local entry_path = Path:new(entry):parent():absolute()
--   actions._close(prompt_bufnr, true)
--   entry_path = Path:new(entry):parent():absolute()
--   entry_path = entry_path:gsub("\\", "\\\\")
--
--   vim.cmd("NvimTreeClose")
--   vim.cmd("NvimTreeOpen " .. entry_path)
--
--   local file_name = nil
--   for s in string.gmatch(entry, "[^/]+") do
--       file_name = s
--   end
--
--   vim.cmd("/" .. file_name)
-- end

telescope.setup({
	picker = {
		hidden = false,
	},
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = require("telescope.actions").close,
				-- ["<C-s>"] = open_in_nvim_tree,
			},
			n = {
				["<C-q>"] = require("telescope.actions").close,
				-- ["<c-s>"] = open_in_nvim_tree,
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
		prompt_prefix = "  ",
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
	},
})

-- https://github.com/nvim-telescope/telescope.nvim/pull/1653
