require("cmp").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `` after select function or method item
	auto_select = true, -- auto select first item
})
require("nvim-autopairs").enable()
require("nvim-autopairs").setup({})
