local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter")
if not treesitter_status_ok then
	return
end

require("nvim-treesitter.configs").setup({
	auto_install = true,
	ensure_installed = {
		"bash",
		"markdown",
		"typescript",
		"css",
		"php",
		"vue",
		"json",
		"tsx",
		"scss",
		"lua",
		"yaml",
		"html",
		"graphql",
		"javascript",
	},
	ignore_install = { "" },
	highlight = { enable = true, use_languagetree = true },
	indent = { enable = true },
	context_commentstring = { enable = true },
	autotag = {
		enable = true,
		filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
	},
	autopairs = { enable = false },
	rainbow = {
		enable = true,
		-- disable = { "html" }, --list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

--require("vim.treesitter.query").set_query(
--	"ecma",
--	"injections",
--	"((comment) @_html_comment (#eq? @_html_comment '/* html */') (template_string) @html)"
--)
--require("vim.treesitter.query").set_query(
--	"ecma",
--	"injections",
--	"(((template_string) @_template_string (#match? @_template_string '^`#html')) @html)"
--)
--require("vim.treesitter.query").set_query(
--	"ecma",
--	"injections",
--	"((comment) @_css_comment (#eq? @_css_comment '/* css */') (template_string) @css)"
--)
--require("vim.treesitter.query").set_query(
--	"ecma",
--	"injections",
--	"(((template_string) @_template_string (#match? @_template_string '^`#css')) @css)"
--)

require("Comment").setup({
	-- toggler = {
	-- 	---Line-comment toggle keymap
	-- 	line = "cc",
	-- 	---Block-comment toggle keymap
	-- 	block = "bb",
	-- },
	-- opleader = {
	-- 	---Line-comment keymap
	-- 	line = "cc",
	-- 	---Block-comment keymap
	-- 	block = "bb",
	-- },
	mappings = {
		-- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = false,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = false,
	},
})

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
