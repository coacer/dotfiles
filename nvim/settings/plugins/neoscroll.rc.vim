lua << EOF
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'}
})
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '125'}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '125'}}
t['zt']    = {'zt', {'100'}}
t['zz']    = {'zz', {'75'}}
t['zb']    = {'zb', {'100'}}

require('neoscroll.config').set_mappings(t)
EOF
