_G.put = function(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

require("options")      -- 通用配置
require("pack")         -- 包管理器
require("plugins")      -- 插件
require("keymaps")      -- 键盘映射
require("filetype")     -- 文件类型配置
