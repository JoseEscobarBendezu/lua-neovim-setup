return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

		vim.g.lazygit_floating_window_border_chars = { " ", "", " ", " ", " ", "", " ", " " } -- customize lazygit popup window border characters
		vim.g.lazygit_use_custom_config_file_path = 1 -- config file path is evaluated if this value is 1
		vim.g.lazygit_config_file_path = prefix .. "/nvim/config.yml" -- custom config file path
	end,
}
