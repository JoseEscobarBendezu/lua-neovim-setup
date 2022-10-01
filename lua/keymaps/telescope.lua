local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>", opts)
keymap("n", "<C-r>", "<cmd>lua require('telescope.builtin').live_grep({hidden = true})<CR>", opts)
keymap("n", "<C-b>", ":Telescope git_branches<CR>", opts)
keymap("n", "<C-s>", ":Telescope git_stash<CR>", opts)
keymap('n', '<C-p>', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
-- keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers({hidden = true})<CR> ", opts)
-- keymap('n', '<leader>h', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
