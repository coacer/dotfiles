local Helper = {}

function Helper.array_to_string(array)
  local str = ''
  for i, v in ipairs(array) do
    if i == 1 then
      str = v
    else
      str = str .. ' ' .. v
    end
  end

  return str
end

function Helper.dump(obj)
  print(vim.inspect(obj))
end

function Helper.trim(str)
  return str:gsub('%s+', '')
end

function Helper.removekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

return Helper
