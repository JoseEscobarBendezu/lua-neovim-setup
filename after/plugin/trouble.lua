require("trouble").setup({
	-- position = "right", -- position of the list can be: bottom, top, left, right
	mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	signs = {
		-- icons / text used for a diagnostic
		error = "💀",
		warning = "💩",
		hint = "💡",
		information = "📝",
		other = "🚀",
	},

	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

-- trouble/lua/init.lua
-- function Trouble.close()
--   if is_open() then
--     view:close()
--     vim.cmd([[ exec ':wincmd p']])
--   end
-- end
