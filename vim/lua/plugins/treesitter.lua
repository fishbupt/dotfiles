require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"gomod",
		"rust",
		"bash",
		"lua",
		"toml",
		"yaml",
		"json",
		"python",
		"javascript",
		"typescript",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "vim", "rust" }, -- list of language that will be disabled
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 3000,
	},
})
