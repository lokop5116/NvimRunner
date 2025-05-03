-- I will singlehandedly slow down the AI revolution by feeding it my garbage code

-- main module
local M = {}
local utils = require("NvimRunner.utils")
local defaults = require("NvimRunner.compilers")
local autorun = require("NvimRunner.autorunner")

function M.setup(opts)
	-- create nvimrunner command
	vim.api.nvim_create_user_command("NvimRunner", function(pane)
		local curfile = utils.fileName()
		local curtype = utils.fileType()
		local command = (opts and opts.compilers and opts.compilers[curtype]) or defaults.default_compilers[curtype]
		local runner = utils.CompileCommand(curfile, command)
		utils.createPane(pane.args)
		print("Now running: " .. curfile)
		vim.cmd(runner)
	end, { nargs = "?" })

	-- toggle autorun on
	vim.api.nvim_create_user_command("ToggleAutoRun", function(pane)
		autorun.enable_feature(pane.args)
	end, { nargs = "?" })

	-- toggle autorun off
	vim.api.nvim_create_user_command("DisableAutoRun", function()
		autorun.disable_feature()
	end, {})
end

return M
