-- Auto-import all subdirectories under plugins/
local plugins = {}

-- Get the plugins directory path
local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins"
local entries = vim.fn.readdir(plugin_path)

for _, entry in ipairs(entries) do
  local full_path = plugin_path .. "/" .. entry
  -- Only import directories (skip files like init.lua, telescope.lua, etc.)
  if vim.fn.isdirectory(full_path) == 1 then
    table.insert(plugins, { import = "plugins." .. entry })
  end
end

return plugins
