-- Undo tree
return {
  'sjl/gundo.vim',
  cmd = 'GundoToggle',
  keys = '<F1>',
  config = function()
    -- Use python3 for gundo (default is python2.4)
    vim.g.gundo_prefer_python3 = 1
    vim.keymap.set('n', '<F1>', ':GundoToggle<CR>')
  end,
}
