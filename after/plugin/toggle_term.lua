require("toggleterm").setup({
	shade_terminals = false,
	direction = "float",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "single",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		winblend = 3,
	},
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		FloatBorder = {
			guifg = "#1f1f28",
			guibg = "#1f1f28",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	-- vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-t>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
	vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
	vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)
end

local opt = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-t>", ":ToggleTerm dir=~/Desktop<CR>", opt)

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
