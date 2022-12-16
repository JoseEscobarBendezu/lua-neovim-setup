function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-t>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
	vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)
end

local opt = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-t>", ":ToggleTerm size=60 dir=~/Desktop direction=vertical<CR>", opt)

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
