local tree_c = require("nvim-tree.config")
local tree_cb = tree_c.nvim_tree_callback
local vimp = require("vimp")

local g = vim.g

g.nvim_tree_auto_ignore_ft = { "dashboard", "startify" }
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" })
g.nvim_tree_allow_resize = 1
g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names

g.nvim_tree_special_files = {}

g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}
g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
	folder = {
		-- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}


vimp.nnoremap("-", ":NvimTreeToggle<CR>")
vimp.nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
vimp.nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
	update_cwd = true,
  open_on_setup = false,
  open_on_tab = false,
  filters = {
    dotfiles = true,
    custom = {},
  },
  git = {
    enable = false,
    ignore = true,
  },
  view = {
    width = 30,
    side = 'left',
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    }
  },
})
