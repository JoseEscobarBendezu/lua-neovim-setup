local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-g>", ":TroubleToggle<CR>", opts)
keymap("n", "<C-d>", ":NvimTreeToggle<CR>", opts)
