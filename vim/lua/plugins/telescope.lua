require("telescope").setup({
	defaults = {
		--vimgrep_arguments = {
		--	"rg",
		--	"--color=never",
		--	"--no-heading",
		--	"--with-filename",
		--	"--line-number",
		--	"--column",
		--	"--smart-case",
		--	"--max-columns = 150",
		--	"--glob=!git/*",
		--	"--hidden",
		--},
		prompt_prefix = "🔍",
		selection_caret = " ",
		layout_config = {
			horizontal = { prompt_position = "bottom", width = 0.7, preview_cutoff = 60 },
			vertical = { mirror = false },
		},
	},
	pickers = {
		buffers = {
			previewer = false,
		},
		find_files = {
			previewer = false,
		},
		live_grep = {
			previewer = false,
		},
		grep_string = {
			previewer = false,
		},
	},
	extensions = {
		sessions_picker = {
			sessions_dir = vim.fn.stdpath('data') ..'/sessions/'
		}
	},
})
require("telescope").load_extension("sessions_picker")

vimp = require("vimp")

vimp.nnoremap("<C-F>", "<cmd>Telescope find_files<cr>")
vimp.nnoremap("<C-B>", "<cmd>Telescope buffers<cr>")
vimp.nnoremap("<C-G>", "<cmd>Telescope live_grep<cr>")
vimp.nnoremap("<leader>fs", "<cmd> Telescope lsp_document_symbols<cr>")
vimp.nnoremap("<leader>ff", "<cmd>Telescope grep_string<cr>")
vimp.nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
vimp.nnoremap("<leader>fp", "<cmd>Telescope sessions_picker sessions_picker<cr>")

--vimp.nnoremap("<leader>go", "<cmd>Telescope grep_string find_command='rg, --recall'<CR>")
