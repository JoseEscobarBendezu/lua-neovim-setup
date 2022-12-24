local keymaps = {}

keymaps.set = function(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap.set
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "gp", vim.diagnostic.open_float, opts)
	keymap("n", "pd", vim.diagnostic.goto_prev, opts)
	keymap("n", "nd", vim.diagnostic.goto_next, opts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "gh", vim.lsp.buf.hover, bufopts)
	keymap("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gc", vim.lsp.buf.code_action, bufopts)
	keymap("n", "gr", vim.lsp.buf.rename, bufopts)
	keymap("n", "gv", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "gx", "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
	-- bufmap(bufnr, "n", "gr", vim.lsp.buf.references, bufopts) -- use telescope lsp references <C-r>
	-- bufmap(bufnr, "n", "gt", "<cmd>tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
	-- bufmap(bufnr, 'n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', bufopts)
end

return keymaps
