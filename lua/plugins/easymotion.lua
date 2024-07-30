return {
	"easymotion/vim-easymotion",
	--lazy = false,
	config = function()
		vim.g.EsyMotion_do_mapping = 0 -- Disable default mappings
	end,
}
