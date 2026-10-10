return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
	config = function()
    local ts = require("nvim-treesitter")

		local languages = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
      "javascript",
      "typescript",
      "css",
      "html",
      "vue",
      "bash",
      "java",
      "gitcommit",
      "php",
      "markdown",
		}

    ts.install(languages)
	end,
}
