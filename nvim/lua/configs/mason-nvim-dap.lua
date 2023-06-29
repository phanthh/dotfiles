local dap = require("dap")

require("mason-nvim-dap").setup({
	ensure_installed = {
		"python",
	},
})

dap.adapters.python = {
	type = "executable",
	command = "debugpy-adapter",
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = "python",
	},
}
