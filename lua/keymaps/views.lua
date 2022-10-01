local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<F1>", "<C-e>", opts)
keymap("n", "<F2>", "<C-y>", opts)
keymap("n", "<F3>", "zz", opts)
keymap("n", "<F4>", "M", opts)

keymap("n", "<F5>", "<C-w>v", opts)
keymap("n", "<F6>", "<C-w>s", opts)
keymap("n", "<F7>", "<C-w>T", opts)

keymap("n", "<F9>", "<C-f>", opts)
keymap("n", "<F10>", "<C-b>", opts)


keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)


keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)

keymap("n", "<A-1>", ":LualineBuffersJump 1<CR>", opts)
keymap("n", "<A-2>", ":LualineBuffersJump 2<CR>", opts)
keymap("n", "<A-3>", ":LualineBuffersJump 3<CR>", opts)
keymap("n", "<A-4>", ":LualineBuffersJump 4<CR>", opts)
keymap("n", "<A-5>", ":LualineBuffersJump 5<CR>", opts)
keymap("n", "<A-6>", ":LualineBuffersJump 6<CR>", opts)
keymap("n", "<A-7>", ":LualineBuffersJump 7<CR>", opts)
keymap("n", "<A-8>", ":LualineBuffersJump 8<CR>", opts)
keymap("n", "<A-9>", ":LualineBuffersJump 9<CR>", opts)

keymap("n", "\\1", "1gt", opts)
keymap("n", "\\2", "2gt", opts)
keymap("n", "\\3", "3gt", opts)
keymap("n", "\\4", "4gt", opts)
keymap("n", "\\5", "5gt", opts)
keymap("n", "\\6", "6gt", opts)
keymap("n", "\\7", "7gt", opts)
keymap("n", "\\8", "8gt", opts)
keymap("n", "\\9", "9gt", opts)
