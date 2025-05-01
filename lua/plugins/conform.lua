return {
	"stevearc/conform.nvim",
	dependencies = {
		{ "lewis6991/gitsigns.nvim" },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local function format_hunks()
			local ignore_filetypes = { "lua", "php" }

			if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
				vim.notify("range formatting for " .. vim.bo.filetype .. " not working properly.")
				return
			end

			local hunks = require("gitsigns").get_hunks()

			if hunks == nil then
				return
			end

			local format = require("conform").format

			local function format_range()
				if next(hunks) == nil then
					vim.notify("save and formatting", "info", { title = "formatting" })
					return
				end
				local hunk = nil
				while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
					hunk = table.remove(hunks)
				end

				if hunk ~= nil and hunk.type ~= "delete" then
					local start = hunk.added.start
					local last = start + hunk.added.count
          local last_hunk_line
          local status, result = pcall(function()
   					-- nvim_buf_get_lines uses zero-based indexing -> subtract from last
            return vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
          end)

          if status then
            last_hunk_line = result
          else
            local line_count = vim.api.nvim_buf_line_count(0)
            last_hunk_line = tostring(line_count)
          end

					local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
					format({ range = range, async = false, lsp_fallback = true }, function()
						vim.defer_fn(function()
							format_range()
						end, 1)
					end)
				end
			end

			format_range()
		end

		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				vue = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
        -- php = { "php-cs-fixer", "php-cs-fixer", stop_after_firststop_after_first = true },
			},
			format_on_save = function()
				format_hunks()
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format File or Range (visual mode)" })
	end,
}
