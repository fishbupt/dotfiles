local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
	Lsp_status.on_attach(client)
	require("illuminate").on_attach(client)

	local function buf_set_keymap(key)
	  local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, key[1], key[2], key[3], opts)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings
  -- Global Mappings
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  buf_set_keymap{ 'n', '<space>e', '<cmd> lua vim.diagnostic.open_float()<CR>' }
  buf_set_keymap{ 'n', '[d', '<cmd> lua vim.diagnostic.goto_prev()<CR>' }
  buf_set_keymap{ 'n', ']d', '<cmd> lua vim.diagnostic.goto_prev()<CR>' }
  buf_set_keymap{ 'n', '<space>q', '<cmd> lua vim.diagnostic.setloclist()<CR>' }
  
  -- Buffer Local Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap{ 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' }
  buf_set_keymap{ 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' }
  buf_set_keymap{ 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' }
  buf_set_keymap{ 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' }
  buf_set_keymap{ 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>' }
  buf_set_keymap{ 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' }
  buf_set_keymap{ 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' }
  buf_set_keymap{ 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' }
  buf_set_keymap{ 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>' }
  buf_set_keymap{ 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>' }
  buf_set_keymap{ 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>' }
  buf_set_keymap{ 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' }
  buf_set_keymap{ 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>' }
end
  
