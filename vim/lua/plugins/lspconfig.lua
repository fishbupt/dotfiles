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
  
-- Configure lua language server for neovim development
-- 需要安装lua-language-server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local sumneko_root_path = ""
local sumneko_binary = ""
if vim.fn.has("unix") == 1 then
  print("Not Support yet")
elseif vim.fn.has("win64") == 1 then
  sumneko_root_path = "C:/tools/lua-language-server"
  sumneko_binary = "C:/tools/lua-language-server/bin/lua-language-server.exe"
else
  print("Unsupported system for sumneko")
end

local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
      -- Setup your lua path
      path = runtime_path,
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	return {
		-- enable snippet support
		capabilities = capabilities,
		-- map buffer local keybindings when the language server attaches
		on_attach = on_attach,
	}
end

local function setup_servers()
	--local servers = { 'pyright', 'clangd', 'cmake', 'tsserver', 'lua' }
	local servers = {"sumneko_lua", "cmake", "pyright", "clangd" }
	for _, server in pairs(servers) do
		local config = make_config()

		-- language specific config
		if server == "sumneko_lua" then
      config.cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"}
			config.settings = lua_settings
		elseif server == "clangd" then
			config.handlers = Lsp_status.extensions.clangd.setup()
			config.cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--all-scopes-completion",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--cross-file-rename",
			}
    elseif server == "cmake" then
      config.autostart = false -- 需要手动启动cmake server
		end

		require("lspconfig")[server].setup(config)
	end
end

setup_servers()

