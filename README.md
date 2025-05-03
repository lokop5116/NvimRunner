# 🏃‍♂️ NvimRunner

Plugin to run your current file inside Neovim. Works by running compile command to inbuilt terminal. Easy to specify your own compiler for any file extension.

## Features

| **Command** | **Description** |
| :--- | :---: |
| _:NvimRunner {arg}_ | Runs current file, {arg} specifies which way to split terminal ( v/h ) |
| _:ToggleAutoRun {arg}_ | Toggles autorun on, runs :NvimRunner {arg} everytime buffer is saved |
| _:DisableAutoRun_ | Toggles autorun off |

## Demonstration




## Languages Supported

>[!warning]
>Ensure that compiler for whatever language you run is already installed

Additional languages can be added yourself. [ See Configuration ](#configuration)

While being run, {file} is replaced with filename ( + extension ) and {name} is replaced with filename ( without extension ).

For example for some test.c file,

Before substitution-

    gcc {file} -o {name} && ./{name} 

After substitution-

    gcc test.c -o test && ./test


| **Language** | **Command Run** |
| :--- | :---: |
| .sh | "./{file}" |
| .cpp | "g++ {file} -o {name} && ./{name}" |
| .c | "gcc {file} -o {name} && ./{name}" |
| .py | "python3 {file}" |
| .java | "javac {file} && java {name}" |
| .rs | "rustc {file} && ./{name}" |
| .rb | "ruby {file}" |
| .pl | "perl {file}" |
| .v | "iverilog {file} -o {name} && vvp {name}" |


## Installation 

Installl using any plugin manager.

Recommended to use [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
  {
  "lokop5116/NvimRunner",
  opts = { -- your configuration
    compilers = {},
    }
}
```

## Configuration

Adding your own language-

```lua
{
"lokop5116/NvimRunner",
opts = {
  compilers = {
  ["file extension"] = "command to be run on terminal"
    }
  }
}
```

For example, adding clang++ as compiler for C++ files-

```lua
-- add this line to compilers
 ["cpp"] = "clang++ {file} -o {name} && ./{name}" 
```
