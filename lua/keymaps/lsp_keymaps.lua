local keymaps = {}

keymaps.set = function(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap.set
	local bufmap = vim.api.nvim_buf_set_keymap

	keymap("n", "gp", "<cmd> lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "]d", "<cmd> lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "[d", "<cmd> lua vim.diagnostic.goto_next()<CR>", opts)
	bufmap(bufnr, "n", "gr", "<cmd> lua vim.lsp.buf.rename()<CR>", opts)
	bufmap(bufnr, "n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts)
	bufmap(bufnr, "n", "gh", "<cmd> lua vim.lsp.buf.hover()<CR>", opts)
	bufmap(bufnr, "n", "gd", "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
	bufmap(bufnr, "n", "gv", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bufmap(bufnr, "n", "gx", "<cmd>split<cr><cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bufmap(bufnr, "n", "gt", "<cmd>tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bufmap(bufnr, "n", "gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- bufmap(bufnr, 'n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', opts)
end

return keymaps
