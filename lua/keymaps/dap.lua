local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

keymap("n", "<leader><F1>", '<cmd>lua require"dap".continue()<CR>', opts)
keymap("n", "<leader><F2>", '<cmd>lua require"dap".step_over()<CR>', opts)
keymap("n", "<leader><F3>", '<cmd>lua require"dap".step_into()<CR>', opts)
keymap("n", "<leader><F4>", '<cmd>lua require"dap".step_out()<CR>', opts)
keymap("n", "<leader><F5>", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap("n", "<leader><F6>", '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)

keymap("n", "<leader><F9>", "<cmd>lua require'dapui'.toggle()<CR>", opts)
