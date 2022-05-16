local saga = require("lspsaga")
local vimp = require("vimp")
saga.init_lsp_saga({
  --debug = true,
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
})

vimp.nnoremap({ "silent" }, "gh", ":Lspsaga lsp_finder<CR>")
vimp.nnoremap({ "silent" }, "<leader>ca", ":Lspsaga code_action<CR>")
vimp.vnoremap({ "silent" }, "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>")

vimp.nnoremap({ "silent" }, "K", ":Lspsaga hover_doc<CR>")
--vimp.nnoremap( {'silent'}, '<A-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]])
--vimp.nnoremap( {'silent'}, '<A-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]])

vimp.nnoremap({ "silent" }, "gs", ":Lspsaga signature_help<CR>")

vimp.nnoremap({ "silent" }, "<leader>crn", ":Lspsaga rename<CR>")

vimp.nnoremap({ "silent" }, "<leader>cpd", ":Lspsaga preview_definition<CR>")

vimp.nnoremap({ "silent" }, "<leader>cld", ":Lspsaga show_line_diagnostics<CR>")

vimp.nnoremap({ "silent" }, "[e", ":Lspsaga diagnostic_jump_next<CR>")
vimp.nnoremap({ "silent" }, "]e", ":Lspsaga diagnostic_jump_prev<CR>")

vimp.nnoremap({ "silent" }, "<leader>cot", ":Lspsaga open_floaterm<CR>")
