local utils = {}

utils.delete_keymap_config = function(keymaps)
	for mode, command in pairs(keymaps) do
		vim.api.nvim_set_keymap(mode, command[1], "<nop>", { noremap = true, silent = true })
	end
end

utils.set_keymap_config = function(keymaps)
	for mode, keys in pairs(keymaps) do
		for key, command in pairs(keys) do
			if key == "<leader>up" or key == "`" or key == "<leader>fe" then
				vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = false })
			else
				vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
			end
		end
	end
end

return utils
