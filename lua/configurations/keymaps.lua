local keymaps = {}

keymaps.delete_default = {
	["n"] = {
		"<C-q>",
		"<C-z>",
		"<C-c>",
		"<F1>",
		"<F11>",
		"`",
		"``",
		"K",
		"zz",
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
	},
	["t"] = {
		"<C-t>",
	},
}

keymaps.basic = {
	["n"] = {
		["r"] = "<C-r>",
		["w"] = ":w<CR>",
		["f"] = "<Plug>(easymotion-overwin-f2)",
		["Q"] = ":%bd|e#|bd#<cr>|'\"",
	},
	["i"] = {
		["<C-q>"] = "<Esc>",
		["<C-l>"] = "<Right>",
		["<C-h>"] = "<Left>",
		["<C-k>"] = "<Up>",
		["<C-j>"] = "<Down>",
	},
}

keymaps.view_panels_control = {
	["n"] = {

		["<F1>"] = "<C-e>",
		["<F2>"] = "<C-y>",
		["<F3>"] = "zz",
		["<F4>"] = "M",

		["<F5>"] = "<C-w>v",
		["<F6>"] = "<C-w>s",
		["<F7>"] = "<C-w>T",

		["<F9>"] = "<C-f>",
		["<F10>"] = "<C-b>",

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

return keymaps
