local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

keymap("n", "<leader><F1>", '<cmd>lua require"dap".continue()<CR>', opts)
keymap("n", "<leader><F2>", '<cmd>lua require"dap".step_over()<CR>', opts)
keymap("n", "<leader><F3>", '<cmd>lua require"dap".step_into()<CR>', opts)
keymap("n", "<leader><F4>", '<cmd>lua require"dap".step_out()<CR>', opts)
keymap(
	"n",
	"<leader><F5>",
	'<cmd>lua require"dapui".toggle()<CR><cmd>lua require"dap".toggle_breakpoint()<CR><cmd>lua require"dapui".toggle()<CR>',
	opts
)
keymap("n", "<leader><F6>", '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)

keymap("n", "<leader><F9>", "<cmd>lua require'dapui'.toggle()<CR>", opts)

-- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
