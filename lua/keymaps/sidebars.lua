local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-l>", ":TroubleToggle<CR>", opts)
keymap("n", "<C-d>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-t>", ":TagbarToggle<CR>", opts)
