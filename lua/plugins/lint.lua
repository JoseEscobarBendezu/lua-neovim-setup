return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	config = function()
		local lint = require("lint")

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    local eslint = lint.linters.eslint_d
    local eslint_d = lint.linters.eslint_d

    -- Sobrescribir el parser para limpiar stderr del output
    eslint_d.process = function(output, linter_cwd)
      -- Extraer solo la parte JSON (después del primer '[')
      local json_start = output:find("%[")
      if json_start then
        output = output:sub(json_start)
      end
      return require("lint.parser").from_json(output, linter_cwd)
    end

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			vue = { "eslint_d" },
      -- lua = { "stylua" },
			-- javascriptreact = { "eslint_d" },
			-- typescriptreact = { "eslint_d" },
    }

    eslint.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			-- try to ignore "No ESLint configuration found" error
			-- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
			-- update: 20240814, following is working
			if diagnostic.message:find("Error: Could not find config file") then
				return nil
			end
      if diagnostic.message:find("Could not parse linter output due to: Expected value but found invalid token at character 1") then
        return nil
      end
			return diagnostic
		end)

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
