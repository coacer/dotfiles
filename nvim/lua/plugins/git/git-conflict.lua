-- Git conflict resolution
return {
  'akinsho/git-conflict.nvim',
  event = 'BufReadPost',
  config = function()
    require('git-conflict').setup({
      default_mappings = true,
      disable_diagnostics = false,
      highlights = {
        incoming = 'DiffText',
        current = 'DiffAdd',
      }
    })
  end,
}
