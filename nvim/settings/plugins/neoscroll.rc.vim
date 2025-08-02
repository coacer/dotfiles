lua << EOF
local neoscroll = require('neoscroll')

neoscroll.setup({})

-- スクロールマッピング（新形式）
local map = function(lhs, lines, opts)
  vim.keymap.set('n', lhs, function()
    neoscroll.scroll(lines, opts)
  end, { silent = true })
end

map('<C-u>', -vim.wo.scroll, { move_cursor = true, duration = 125 })
map('<C-d>',  vim.wo.scroll, { move_cursor = true, duration = 125 })
map('<C-b>', -vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 125 })
map('<C-f>',  vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 125 })

-- z系再描画マッピング（新形式）
vim.keymap.set('n', 'zz', function()
  local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
  require('neoscroll').zz({
    half_win_duration = half_win,
    duration = 75
  })
end, { silent = true })

vim.keymap.set('n', 'zt', function()
  local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
  require('neoscroll').zt({
    half_win_duration = half_win,
    duration = 100
  })
end, { silent = true })

vim.keymap.set('n', 'zb', function()
  local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
  require('neoscroll').zb({
    half_win_duration = half_win,
    duration = 100
  })
end, { silent = true })

EOF

