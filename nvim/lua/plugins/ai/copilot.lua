-- GitHub Copilot
return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    -- Key mappings
    vim.keymap.set('i', '<C-g><c-h>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-g><c-p>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<C-g><c-n>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<C-g><c-f>', '<Plug>(copilot-dismiss)')
  end,
}
