local M = {}

-- fetch file name with extension
function M.fileName()
	return vim.fn.expand("%:t")
end

-- fetch file extension
function M.fileType()
	return vim.fn.expand("%:t"):match("%.([^%.]+)$")
end

-- create new pane, by default is h
function M.createPane(window)
	if window == "v" then
		vim.cmd(":vsplit")
	elseif window == "h" then
		vim.cmd(":split")
	else
		vim.cmd(":split")
	end
end

-- substitutes {file} and {name} in command, returns 'no compiler specified' if valid compiler for file extension is not found
function M.CompileCommand(filename, command)
	local comp = "echo 'no compiler specified'"
	local name = filename:match("(.+)%..+")

	if command ~= nil then
		comp = command:gsub("%{file}", filename)
		comp = comp:gsub("%{name}", name)
	end

	return "terminal " .. comp
end

return M
