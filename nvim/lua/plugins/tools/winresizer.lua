-- Window resizer plugin
return {
  'simeji/winresizer',
  keys = {
    { '<Leader>u', '<cmd>WinResizerStartResize<cr>', desc = 'Start window resize mode' },
  },
  config = function()
    -- winresizer configuration
    vim.g.winresizer_start_key = '<Leader>u'

    -- デフォルトのC-eが適用されるバグ？があるので上書きする
    vim.keymap.set('n', '<C-e>', '<Cmd>BufferPrevious<CR>', { silent = true })
  end,
}
