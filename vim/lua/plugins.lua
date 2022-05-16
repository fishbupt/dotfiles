local packer = require("packer")

return packer.startup(function()
	-- Basic
	use("wbthomason/packer.nvim")
	use("svermeulen/vimpeccable")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-commentary")
	use("svermeulen/vim-yoink")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopair")
		end,
	})
	use("p00f/nvim-ts-rainbow")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.blankline")
		end,
	})
	use("arkav/lualine-lsp-progress")

  use({
    "glepnir/dashboard-nvim",
    config = function() 
      require("plugins.dashboard")
    end,
  })
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		after = "nvim-web-devicons",
		config = function()
			require("plugins.nvimtree")
		end,
	})

	use("folke/lsp-colors.nvim")
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			vim.g.symbols_outline = {
				auto_preview = false,
			}
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.icons")
		end,
	})

	--- Colorthemes
	use({
		"EdenEast/nightfox.nvim",
    requires = {
		  "nvim-lualine/lualine.nvim",
      "akinsho/bufferline.nvim"
    },
		config = function()
			require("plugins.theme")
		end,
	})

	use({
		"sbdchd/neoformat",
		config = function()
			require("plugins.neoformat")
		end,
	})
	-- use 'kabouzeid/nvim-lspinstall' -- not support windows

	--- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "JoseConseco/telescope_sessions_picker.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	})
	--- LSP config
	use({
		"neovim/nvim-lspconfig",
		requires = "nvim-lua/lsp-status.nvim",
		config = function()
			require("plugins.lspconfig")
		end,
	})
	--- LSP companies
	use({
		"glepnir/lspsaga.nvim",
		config = function()
			require("plugins.lspsaga")
		end,
	})
	use({
		"onsails/lspkind-nvim",
		config = function()
			require("plugins.lspkind")
		end,
	})
	use({ "RRethy/vim-illuminate" })
	use({ "ray-x/lsp_signature.nvim" })
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		config = function()
			require("plugins.trouble")
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
		},
		config = function()
			require("plugins.nvim-cmp")
		end,
	})
	use({
		"stevearc/qf_helper.nvim",
		config = function()
			require("plugins.qf_helper")
		end,
	})
  -- Debug
  use({
    "lewis6991/impatient.nvim"
  })
end)
