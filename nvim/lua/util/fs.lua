local fs = {}

function fs.exists(file)
  local f = io.open(file, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function fs.isdir(path)
  return fs.exists(path)
end

return fs
