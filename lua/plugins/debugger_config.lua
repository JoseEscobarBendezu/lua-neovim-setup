local dap = require("dap")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-repl",
	callback = function(args)
		vim.api.nvim_buf_set_option(args.buf, "buflisted", false)
	end,
})

require("dap-install").setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	verbosely_call_debuggers = true,
})

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/dapinstall/jsnode" .. "/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	-- {
	--   name = 'Launch',
	--   type = 'node2',
	--   request = 'launch',
	--   program = '${workspaceFolder}/${file}',
	--   cwd = vim.fn.getcwd(),
	--   sourceMaps = true,
	--   protocol = 'inspector',
	--   console = 'integratedTerminal'
	-- },
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.configurations.typescript = {
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🔵", texthl = "", linehl = "", numhl = "" })

require("dapui").setup()
