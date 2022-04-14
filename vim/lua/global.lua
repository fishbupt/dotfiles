local global = {}
local os_name = vim.loop.os_uname().sysname

_G.put = function(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

function global:load_variables()
	self.is_mac = string.match(os_name, "Darwin") ~= nil
	self.is_linux = string.match(os_name, "Linux") ~= nil
	self.is_windows = string.match(os_name, "Windows") ~= nil
	if self.is_windows then
		self.home = os.getenv("HOMEDRIVE") or "C"
		self.home = self.home .. (os.getenv("HOMEPATH") or "\\")
	else
		self.home = os.getenv("HOME") or "."
	end

	self.vim_path = vim.fn.stdpath("config")
	local path_sep = self.is_windows and "\\" or "/"
	self.cache_dir = self.home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. "modules"
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

global:load_variables()

return global
