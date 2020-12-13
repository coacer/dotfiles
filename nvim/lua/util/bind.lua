local helper = require('util.helper')
local array_to_string = helper.array_to_string
local dump = helper.dump
local trim = helper.trim
local removekey = helper.removekey

-- Mapクラス
local Map = {}

function Map:new()
  self = {
    cmd = '',
    buffer = false,
    options = {
      noremap = true,
      silent = false,
    }
  }

  return setmetatable(self, { __index = Map })
end

function Map:key(cmd)
  self.cmd = self.cmd .. cmd
  return self
end

function Map:ex_input(cmd)
  self.cmd = self.cmd .. (':<C-u>%s'):format(cmd)
  return self
end

function Map:ex_range(cmd, ...)
  local args = array_to_string({...})
  self.cmd = self.cmd .. (':%s %s<CR>'):format(cmd, args)
  return self
end

function Map:ex(cmd, ...)
  local args = array_to_string({...})
  self.cmd = self.cmd .. (':<C-u>%s %s<CR>'):format(cmd, args)
  return self
end

function Map:without_nore()
  self.options.noremap = false
  return self
end

function Map:with_silent()
  self.options.silent = true
  return self
end

function Map:with_buffer()
  self.buffer = true
  return self
end


-- bindインターフェイス
local bind = {}

function bind.map_key(cmd)
  return (Map:new()):key(cmd)
end

function bind.map_ex_input(cmd)
  return (Map:new()):ex_input(cmd)
end

function bind.map_ex_range(cmd, ...)
  return (Map:new()):ex_range(cmd, ...)
end

function bind.map_ex(cmd, ...)
  return (Map:new()):ex(cmd, ...)
end

function bind.set_mappings(mappings)
  for key,value in pairs(mappings) do
      key = trim(key)
      local mode,keymap = key:match("([^|]*)|?(.*)")
      if type(value) == 'table' then
        local rhs = value.cmd
        local options = value.options
        if value.buffer then
          vim.fn.nvim_buf_set_keymap(mode,keymap,rhs,options)
        else
          vim.fn.nvim_set_keymap(mode,keymap,rhs,options)
        end
      end
    end
end

return bind
