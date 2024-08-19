local dap, dapui = require("dap"), require("dapui")

-- :lua print(vim.fn.stdpath('cache'))

local extension_path = vim.env.HOME .. '/appdata/local/nvim-data/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb.exe'

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000
}

local codelldb = {
	name = "Launch lldb",
	type = "codelldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/target/debug/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

dap.configurations.rust = {
	codelldb -- different debuggers or more configurations can be used here
}

-- dapui setup
-- dapui setup
dapui.setup({
    icons = { expanded = "-", collapsed = "$" },
    mappings = {
        expand = "<CR>",
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    layouts = {
        {
            elements = {
                { id = "repl", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 }
            },
            size = 40,
            position = "right",
        },
        {
            elements = { "scopes", "console" },
            size = 25,
            position = "bottom",
        },
    },
    floating = { border = "rounded", mappings = { close = { "q", "<esc>", "<c-o>" } } },
})
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
