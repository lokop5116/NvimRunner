local M = {}

-- all default compilers
M.default_compilers = {
	["sh"] = "./{file}", -- Bash
	["lua"] = "luajit {file}", -- Lua
	["cpp"] = "g++ {file} -o {name} && ./{name}", -- C++
	["c"] = "gcc {file} -o {name} && ./{name}", -- C
	["py"] = "python3 {file}", -- Python
	["java"] = "javac {file} && java {name}", -- Java
	["rs"] = "rustc {file} && ./{name}", -- Rust
	["rb"] = "ruby {file}", -- Ruby
	["pl"] = "perl {file}", -- Perl
	["v"] = "iverilog {file} -o {name} && vvp {name}",
}

return M
