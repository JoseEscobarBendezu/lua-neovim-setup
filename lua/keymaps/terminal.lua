local opts = { buffer = 0 }

vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-i>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)

vim.keymap.set("n", "<C-c>", ":ToggleTerm size=60 dir=~/Desktop direction=vertical<CR>", opts)

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
