local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  -- Load snippet support
	snippet = {
		expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For "vsnip"
      -- luasnip.lsp_expand(args.body)        -- For "luasnip"
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
			return vim_item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
  },
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
    { name = "vsnip"},
		{ name = "path" },
		{ name = "nvim_lua" },
  }, {
		{ name = "buffer" },
	}),
})
