-- Navigation
return {
  'easymotion/vim-easymotion',
  keys = { '<Leader>j', '<Leader><Leader>' },
  config = function()
    vim.keymap.set('', '<Leader>j', '<Plug>(easymotion-bd-w)')
    vim.g['easymotion#is_active'] = 0

    -- Disable Coc during EasyMotion
    vim.api.nvim_create_augroup('EasyMotionCoc', { clear = true })
    vim.api.nvim_create_autocmd('User', {
      group = 'EasyMotionCoc',
      pattern = 'EasyMotionPromptBegin',
      command = 'silent! CocDisable',
    })
    vim.api.nvim_create_autocmd('User', {
      group = 'EasyMotionCoc',
      pattern = 'EasyMotionPromptEnd',
      command = 'silent! CocEnable',
    })
  end,
}
