local nvim_ide_status_ok, nvim_ide = pcall(require, "ide")
if nvim_ide_status_ok == false then
	return
end
-- default components
local bufferlist = require("ide.components.bufferlist")
local explorer = require("ide.components.explorer")
local outline = require("ide.components.outline")
local callhierarchy = require("ide.components.callhierarchy")
local timeline = require("ide.components.timeline")
local terminal = require("ide.components.terminal")
local terminalbrowser = require("ide.components.terminal.terminalbrowser")
local changes = require("ide.components.changes")
local commits = require("ide.components.commits")
local branches = require("ide.components.branches")
local bookmarks = require("ide.components.bookmarks")

nvim_ide.setup({
	-- The global icon set to use.
	-- values: "nerd", "codicon", "default"
	icon_set = "default",
	-- Component specific configurations and default config overrides.
	components = {
		-- The global keymap is applied to all Components before construction.
		-- It allows common keymaps such as "hide" to be overriden, without having
		-- to make an override entry for all Components.
		--
		-- If a more specific keymap override is defined for a specific Component
		-- this takes precedence.
		global_keymaps = {
			-- example, change all Component's hide keymap to "h"
			-- hide = h
		},
		-- example, prefer "x" for hide only for Explorer component.
		-- Explorer = {
		--     keymaps = {
		--         hide = "x",
		--     }
		-- }
	},
	-- default panel groups to display on left and right.
	panels = {
		left = "explorer",
		-- right = "git",
	},
	-- panels defined by groups of components, user is free to redefine the defaults
	-- and/or add additional.
	panel_groups = {
		explorer = {
			-- outline.Name,
			bufferlist.Name,
			branches.Name,
			-- explorer.Name,
			-- bookmarks.Name,
			-- callhierarchy.Name,
			terminalbrowser.Name,
		},
		terminal = { terminal.Name },
		-- git = { changes.Name, commits.Name, timeline.Name, branches.Name },
	},
	-- workspaces config
	workspaces = {
		-- which panels to open by default, one of: 'left', 'right', 'both', 'none'
		auto_open = "left",
	},
	-- default panel sizes for the different positions
	panel_sizes = {
		left = 25,
		right = 30,
		bottom = 15,
	},
})

require("dapui").setup()
local function close_nvim_ide_panels()
	if pcall(require, "ide") then
		local ws = require("ide.workspaces.workspace_registry").get_workspace(vim.api.nvim_get_current_tabpage())
		if ws ~= nil then
			ws.close_panel(require("ide.panels.panel").PANEL_POS_BOTTOM)
			ws.close_panel(require("ide.panels.panel").PANEL_POS_LEFT)
			ws.close_panel(require("ide.panels.panel").PANEL_POS_RIGHT)
		end
	end
end

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	close_nvim_ide_panels()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
