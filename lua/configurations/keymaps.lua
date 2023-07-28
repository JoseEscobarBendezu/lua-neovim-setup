local keymaps = {}

keymaps.delete_default = {
	["n"] = {
		"p",
		"n",
		"<C-q>",
		"<C-i>",
		"<C-w>",
		"<C-z>",
		"<C-c>",
		"<F1>",
		"<F11>",
		"`",
		"``",
		"K",
		"zz",
		"gd",
		"go",
		"gt",
		"gT",
		"<C-w>v",
		"<C-w>s",
		"<C-w>T",
		"M",
		"U",
		"q",
		"Q",
		"w",
		"0",
		"r",
		"<C-r>",
		"<C-e>",
		"<C-y>",
		"<C-t>",
		"<leader>q",
		"<leader>dd",
		"[[",
		"]]",
		"<F1>",
		"e",
		":",
	},
	["t"] = {
		"<C-t>",
	},
	["i"] = {
		"<C-n>",
		"<C-p>",
	},
}

keymaps.basic = {
	["n"] = {
		["pp"] = "]p",
		["r"] = "<C-r>",
		["w"] = ":w<CR>",
		["f"] = "<Plug>(easymotion-overwin-f2)",
		["Q"] = ":%bd|e#|bd#<cr>|'\"",
		["<C-w>"] = "<C-i>",
		["cc"] = "<Plug>(comment_toggle_linewise_current)",
		["nn"] = "<Plug>(comment_toggle_blockwise_current)",
		["<C-q>"] = "<Esc>",
		["<F1>"] = ":LspRestart<CR>",
		["`"] = ":",
	},
	["i"] = {
		["<C-q>"] = "<Esc>",
		["<A-l>"] = "<Right>",
		["<A-h>"] = "<Left>",
		["<A-k>"] = "<Up>",
		["<A-j>"] = "<Down>",
	},
	["v"] = {
		["cc"] = "<Plug>(comment_toggle_linewise_visual)",
		["nn"] = "<Plug>(comment_toggle_blockwise_visual)",
	},
}

keymaps.view_panels_control = {
	["n"] = {

		["<F3>"] = "zz",
		["<F4>"] = "M",

		["<F5>"] = "<C-w>v",
		["<F6>"] = "<C-w>s",
		["<F7>"] = "<C-w>T",

		["<F9>"] = "<C-e>",
		["<F10>"] = "<C-y>",

		["<A-n>"] = "<C-f>",
		["<A-p>"] = "<C-b>",

		["<A-h>"] = "<C-w>h",
		["<A-j>"] = "<C-w>j",
		["<A-k>"] = "<C-w>k",
		["<A-l>"] = "<C-w>l",

		["<A-Up>"] = ":resize -2<CR>",
		["<A-Down>"] = ":resize +2<CR>",
		["<A-Right>"] = ":vertical resize +2<CR>",
		["<A-Left>"] = ":vertical resize -2<CR>",

		["<A-1>"] = ":LualineBuffersJump 1<CR>",
		["<A-2>"] = ":LualineBuffersJump 2<CR>",
		["<A-3>"] = ":LualineBuffersJump 3<CR>",
		["<A-4>"] = ":LualineBuffersJump 4<CR>",
		["<A-5>"] = ":LualineBuffersJump 5<CR>",
		["<A-6>"] = ":LualineBuffersJump 6<CR>",
		["<A-7>"] = ":LualineBuffersJump 7<CR>",
		["<A-8>"] = ":LualineBuffersJump 8<CR>",
		["<A-9>"] = ":LualineBuffersJump 9<CR>",

		["<A-x>1"] = "<cmd>split<CR><cmd>LualineBuffersJump 1<CR>",
		["<A-x>2"] = "<cmd>split<CR><cmd>LualineBuffersJump 2<CR>",
		["<A-x>3"] = "<cmd>split<CR><cmd>LualineBuffersJump 3<CR>",
		["<A-x>4"] = "<cmd>split<CR><cmd>LualineBuffersJump 4<CR>",
		["<A-x>5"] = "<cmd>split<CR><cmd>LualineBuffersJump 5<CR>",
		["<A-x>6"] = "<cmd>split<CR><cmd>LualineBuffersJump 6<CR>",
		["<A-x>7"] = "<cmd>split<CR><cmd>LualineBuffersJump 7<CR>",
		["<A-x>8"] = "<cmd>split<CR><cmd>LualiBuffersJump 8<CR>",
		["<A-x>9"] = "<cmd>split<CR><cmd>LualineBuffersJump 9<CR>",

		["<A-v>1"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 1<CR>",
		["<A-v>2"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 2<CR>",
		["<A-v>3"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 3<CR>",
		["<A-v>4"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 4<CR>",
		["<A-v>5"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 5<CR>",
		["<A-v>6"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 6<CR>",
		["<A-v>7"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 7<CR>",
		["<A-v>8"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 8<CR>",
		["<A-v>9"] = "<cmd>vsplit<CR><cmd>LualineBuffersJump 9<CR>",

		["\\1"] = "1gt",
		["\\2"] = "2gt",
		["\\3"] = "3gt",
		["\\4"] = "4gt",
		["\\5"] = "5gt",
		["\\6"] = "6gt",
		["\\7"] = "7gt",
		["\\8"] = "8gt",
		["\\9"] = "9gt",
	},
}

keymaps.sidebars = {
	["n"] = {
		-- ["e"] = ":TroubleToggle<CR>",
		-- keymap("n", "<C-d>", ":NvimTreeToggle<CR>", opts)
	},
}

keymaps.telescope = {
	["n"] = {
		["<C-p>"] = "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>",
		["<C-f>"] = "<cmd>Telescope file_browser<CR>",
		["<C-l>"] = "<cmd>lua require('telescope.builtin').live_grep({hidden = true})<CR>",
		["<C-r>"] = "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
		["<C-b>"] = ":Telescope git_branches<CR>",
		["<C-s>"] = ":Telescope git_stash<CR>",
		["<C-i>"] = "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
		["<C-e>"] = "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
		["<C-k>"] = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
		["<C-g>"] = "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
	},
}

keymaps.git_diff = {
	["n"] = {
		["<leader>gs"] = ":G<CR>",
		["<leader>up"] = ":Git push --set-upstream origin ",
		["<leader>fe"] = ":Git fetch --all -p<CR>",
		["<leader>pl"] = ":Git pull<CR>",
		["<leader>ss"] = ":Git stash save<CR>",
		["<leader>sp"] = ":Git stash pop<CR>",
		["<leader>dh"] = ":DiffviewFileHistory<CR>",
		["<leader>do"] = ":DiffviewOpen<CR>",
		["<leader>dc"] = ":DiffviewClose<CR>",
	},
}

keymaps.dap = {
	["n"] = {
		["<leader><F1>"] = '<cmd>lua require"dap".continue()<CR>',
		["<leader><F2>"] = '<cmd>lua require"dap".step_over()<CR>',
		["<leader><F3>"] = '<cmd>lua require"dap".step_into()<CR>',
		["<leader><F4>"] = '<cmd>lua require"dap".step_out()<CR>',
		["<leader><F6>"] = '<cmd>lua require"dap.ui.widgets".hover()<CR>',
		["<leader><F9>"] = "<cmd>lua require'dapui'.toggle()<CR>",
		["<leader><F5>"] = '<cmd>lua require"dapui".toggle()<CR><cmd>lua require"dap".toggle_breakpoint()<CR><cmd>lua require"dapui".toggle()<CR>',
	},
}

return keymaps
