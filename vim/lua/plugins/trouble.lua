require("trouble").setup({
	height = 7, -- height of the trouble list
	icons = true, -- use devicons for filenames
	mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "references", "loclist"
	action_keys = { -- key mappings for actions in the trouble list
		close = "q", -- close the list
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		refresh = "r", -- manually refresh
		jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
		jump_close = { "o" }, -- jump to the diagnostic and close the list
		toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
		toggle_preview = "P", -- toggle auto_preview
		hover = "K", -- opens a small poup with the full multiline message
		preview = "p", -- preview the diagnostic location
		close_folds = { "zM", "zm" }, -- close all folds
		open_folds = { "zR", "zr" }, -- open all folds
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
		previous = "k", -- preview item
		next = "j", -- next item
	},
	indent_lines = true, -- add an indent guide below the fold icons
	auto_open = false, -- automatically open the list when you have diagnostics
	auto_close = true, -- automatically close the list when you have no diagnostics
	auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
	auto_fold = true, -- automatically fold a file trouble list at creation
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "ﯧ",
		information = "",
		other = "",
	},
	use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})

local vimp = require("vimp")

vimp.nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
vimp.nnoremap("<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>")
vimp.nnoremap("<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>")
vimp.nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
vimp.nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
vimp.nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")

vimp.nnoremap("<C-j>", ":lua require('trouble').next({skip_groups = true, jump = true})<cr>")
vimp.nnoremap("<C-k>", ":lua require('trouble').preview({skip_groups = true, jump = true})<cr>")
