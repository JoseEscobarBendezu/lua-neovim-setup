-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("nvim-lua/plenary.nvim")
	use("easymotion/vim-easymotion") -- Vim motions on speed!
	use("tpope/vim-fugitive") -- git commands

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use("tpope/vim-surround") -- Autopairs
	use("numToStr/Comment.nvim")

	use("nvim-lualine/lualine.nvim") -- Status bar
	use("rmehri01/onenord.nvim")
	use("lukas-reineke/indent-blankline.nvim") -- Indent rainbow

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "windwp/nvim-ts-autotag" })
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Context comment in html css and js for template-string treesitter
	use("windwp/nvim-autopairs") -- Autopairs ({['`
	use("p00f/nvim-ts-rainbow")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	use("kyazdani42/nvim-web-devicons")

	use("neovim/nvim-lspconfig")

	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use("williamboman/mason.nvim")

	use("jayp0521/mason-null-ls.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin

	use("lewis6991/gitsigns.nvim")

	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("akinsho/toggleterm.nvim")

	if is_bootstrap then
		require("packer").sync()
	end
end)
