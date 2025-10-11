-- Window resizer plugin
return {
  'simeji/winresizer',
  keys = {
    { '<C-u>', '<cmd>WinResizerStartResize<cr>', desc = 'Start window resize mode' },
  },
  config = function()
    -- winresizer configuration
    vim.g.winresizer_start_key = '<C-u>'
  end,
}
