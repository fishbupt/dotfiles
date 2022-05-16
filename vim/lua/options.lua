local global = require("global")
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g

o.encoding = "utf-8"
o.fileencodings = "usc-bom,utf-8,gbk,utf-16le,cp1252,iso-8859,cp936"
o.fileformats = "unix,mac,dos"

local python_prog = os.getenv("PYTHON_HOST_PROG")
local python3_prog = os.getenv("PYTHON3_HOST_PROG")
if python_prog then
	vim.g.python_host_prog = python_prog
end
if python3_prog then
	vim.g.python3_host_prog = python3_prog
end

if global.is_windows then
	o.shell = "cmd.exe"
else
	o.shell = "/bin/sh"
end
-- Indent
o.autoindent = true --  Keep indentation
o.tabstop = 4 --  Set tab equal to 4 spaces
o.softtabstop = 4 --  Set soft tab equal to 4 spaces
o.shiftwidth = 4 --  Set auto indent spacing
o.expandtab = true --  Expand tab into spaces
o.smarttab = true --  Insert spaces in front of lines
o.backspace = "indent,eol,start" -- Make backspace work like most other programs
o.breakindent = true
o.smartindent = true

-- Appearance.
o.cmdheight = 1
o.conceallevel = 0
o.concealcursor = "niv"
o.cursorline = true
o.display = "lastline"
o.laststatus = 2
o.showmode = false
o.showbreak = "↪"
o.list = true
o.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
o.arabicshape = false
o.wrap = false
o.number = true
o.scrolloff = 3
o.showcmd = true
o.showmatch = true
o.signcolumn = "auto" --Display sign only when there is one
o.synmaxcol = 512
o.showtabline = 1
o.termguicolors = true

-- Safety
o.backup = true
o.backupdir = global.cache_dir .. "backup"
o.directory = global.cache_dir .. "swap"
o.undodir = global.cache_dir .. "undo"
o.viewdir = global.cache_dir .. "view"

-- History
o.history = 2048
o.undofile = true

-- Search
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.smartcase = true

-- Others
o.mouse = "a"
o.completeopt="menuone,noinsert,noselect"
-- Create cache dir and subs dir
local createdir = function()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "view",
		global.cache_dir .. "undo",
	}
	-- There only check once that If cache_dir exists
	-- Then I don't want to check subs dir exists
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		vim.loop.fs_mkdir(global.cache_dir, 493)
	end
	for _, v in pairs(data_dir) do
		if vim.fn.isdirectory(v) == 0 then
			vim.loop.fs_mkdir(v, 493)
		end
	end
end

createdir()

-- disable some builtin vim plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
