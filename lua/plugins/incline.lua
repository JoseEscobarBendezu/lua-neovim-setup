return {
	"b0o/incline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local devicons = require("nvim-web-devicons")
		require("incline").setup({
			window = {
				padding = 0,
				margin = {
					horizontal = 0,
					vertical = 0,
				},
			},
			debounce_threshold = {
				falling = 75,
				rising = 75,
			},
			render = function(props)
				-- local bgcol = props.focused and "#658594" or "#16161d"
				local bgcol = "#1e1f28"
				local fgcol = props.focused and "#c0a36e" or ""

				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)

				local function get_git_diff()
					local icons = { removed = "", changed = "", added = "" }
					local signs = vim.b[props.buf].gitsigns_status_dict
					local labels = {}
					if signs == nil then
						return labels
					end
					for name, icon in pairs(icons) do
						if tonumber(signs[name]) and signs[name] > 0 then
							table.insert(labels, { " " .. icon .. signs[name] .. " ", group = "Diff" .. name })
						end
					end
					if #labels > 0 then
						table.insert(labels, { "  " })
					end
					return labels
				end

				local function get_diagnostic_label()
					local icons = { error = "", warn = "", info = "", hint = "󰌶" }
					local label = {}

					if not props.focused then
						return label
					end

					for severity, icon in pairs(icons) do
						local n = #vim.diagnostic.get(
							props.buf,
							{ severity = vim.diagnostic.severity[string.upper(severity)] }
						)
						if n > 0 then
							table.insert(label, { " " .. icon .. n .. " ", group = "DiagnosticSign" .. severity })
						end
					end
					if #label > 0 then
						table.insert(label, { "  " })
					end
					return label
				end

				local function get_file_name()
					local label = {}
					table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color })
					table.insert(label, {
						filename,
						guifg = fgcol,
						-- gui = props.focused and "bold" or "",
						guibg = bgcol,
					})
					table.insert(label, { props.focused and " 🦊 " or " " })
					table.insert(label, { vim.bo[props.buf].modified and " " or "", guifg = "#c90076" })
					if not props.focused then
						label["group"] = "BufferInactive"
					end

					return label
				end

				return {
					{ get_diagnostic_label() },
					{ get_git_diff() },
					{ get_file_name() },
					guibg = props.focused and bgcol or "#14141b",
				}
			end,
		})
	end,
	-- Optional: Lazy load Incline
	-- event = "VeryLazy",
}
