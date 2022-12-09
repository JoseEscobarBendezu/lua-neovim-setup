require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"css",
		"php",
		"vue",
		"json",
		"tsx",
		"jsdoc",
		"scss",
		"lua",
		"yaml",
		"html",
		"graphql",
		"javascript",
	},
	highlight = { enable = true },
	indent = { enable = true },
	context_commentstring = { enable = true },
	autotag = {
		enable = true,
		-- disable = { 'html', 'javascript' }
	},
	autopairs = { enable = false },
	rainbow = {
		enable = true,
		-- disable = { "html" }, --list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

require("Comment").setup()
require("nvim-ts-autotag").setup()

--; .local/share/nvim/after/queries/ecma/injections.scm
--(template_string) @html
--
--or
--
-- ((comment) @_html_comment
--   (#eq? @_html_comment "/* html */")
--   (template_string) @html)
--
-- (((template_string) @_template_string
--  (#match? @_template_string "^`#html")) @html)
--
-- ((comment) @_css_comment
--   (#eq? @_css_comment "/* css */")
--   (template_string) @css)
--
-- (((template_string) @_template_string
--  (#match? @_template_string "^`#css")) @css)
