return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		vim.g.theme_switcher_loaded = true

		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			picker = {
				hidden = false,
			},
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = require("telescope.actions").close,
						["<A-n>"] = require("telescope.actions").preview_scrolling_down,
						["<A-p>"] = require("telescope.actions").preview_scrolling_up,
					},
					n = {
						["<C-q>"] = require("telescope.actions").close,
						["<A-n>"] = require("telescope.actions").preview_scrolling_down,
						["<A-p>"] = require("telescope.actions").preview_scrolling_up,
					},
					-- - `<cr>`: checks out the currently selected branch
					-- - `<C-t>`: tracks currently selected branch
					-- - `<C-r>`: rebases currently selected branch
					-- - `<C-a>`: creates a new branch, with confirmation prompt before creation
					-- - `<C-d>`: deletes the currently selected branch, with confirmation
					--   prompt before deletion
					-- - `<C-y>`: merges the currently selected branch, with confirmation prompt
					--   before deletion
				},
				--[[ vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				}, ]]
				--[[ preview = {
					treesitter = false,
				}, ]]
				prompt_prefix = "🚀 ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
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
				--file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { ".git/", "node_modules" },
				-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				--file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				--grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				--qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				--buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
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
					hidden = true,
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
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							-- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							-- freeze the current list and start a fuzzy search in the frozen list
						},
					},
					-- ... also accepts theme settings, for example:
					-- theme = "dropdown", -- use dropdown theme
					-- theme = { }, -- use own theme spec
					-- layout_config = { mirror=true }, -- mirror preview pane
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("live_grep_args")

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
		vim.api.nvim_set_hl(0, "lualine_a_buffers_active", { bg = "#658594", fg = "#2A2A37", bold = true })
		vim.api.nvim_set_hl(0, "lualine_a_buffers_inactive", { bg = "#2A2A37", fg = "#D4D4D4" })
	end,
}
