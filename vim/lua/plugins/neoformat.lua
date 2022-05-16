local g = vim.g
g.neoformat_basic_format_align = true
g.neoformat_basic_format_retab = true
g.neoformat_basic_format_trim = true
g.neoformat_enabled_cpp = { "clangformat" }
g.neoformat_enabled_c = { "clangformat" }
g.neoformat_c_clang_format = {
	exe = "clang-format",
	args = { "--style=file" },
}
g.neoformat_cpp_clang_format = {
	exe = "clang-format",
	args = { "--style=file" },
}
g.neoformat_enabled_python = { "yapf", "autopep8" }
g.neoformat_python_autopep8 = {
	exe = "autopep8",
	args = { "--max-line-length 120", "--experimental", "-" },
	stdin = true,
}

local vimp = require("vimp")
vimp.nnoremap("<M-f>", ":Neoformat<CR>")
vimp.inoremap("<M-f>", "<esc> :Neoformat<CR>i")

