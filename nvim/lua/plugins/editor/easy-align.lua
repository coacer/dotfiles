-- Text alignment
return {
  'junegunn/vim-easy-align',
  keys = { 'ga', { 'ga', mode = 'x' } },
  config = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
  end,
}
