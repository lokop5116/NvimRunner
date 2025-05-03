local M = {}

-- variable to track current status of autorun
local autorun_enabled = false

-- autocmd_id to later delete it
local autocmd_id = nil

-- pane type to create, defaults to h
local pane = "h"

function M.enable_feature(pane_type)
	-- update pane type for autorun
	pane = pane_type

	-- end if already enabled
	if autorun_enabled then
		return
	end

	autorun_enabled = true

	print("AutoRun enabled!")

	local function on_save()
		vim.cmd(":NvimRunner " .. pane)
	end

	-- run "NvimRunner pane_type" whenever file is saved
	autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		callback = on_save,
	})
end

function M.disable_feature()
	-- end if already disabled
	if not autorun_enabled then
		return
	end

	autorun_enabled = false

	print("AutoRun disabled!")

	-- deletes autocommand for autorun
	if autocmd_id then
		vim.api.nvim_del_autocmd(autocmd_id)
		autocmd_id = nil
	end
end

return M
