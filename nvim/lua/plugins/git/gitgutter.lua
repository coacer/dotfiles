-- Git gutter
return {
  'airblade/vim-gitgutter',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    vim.keymap.set('n', '<Leader>h', ':GitGutterLineHighlightsToggle<CR>', { silent = true })
    vim.opt.updatetime = 100
  end,
}
