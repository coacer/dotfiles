-- Buffer tabs
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  config = function()
    require('barbar').setup()

    -- Tab navigation mappings (same as vim-airline)
    vim.keymap.set('n', '<C-e>', '<Cmd>BufferPrevious<CR>', { silent = true })
    vim.keymap.set('n', '<C-y>', '<Cmd>BufferNext<CR>', { silent = true })

    -- Custom highlight for modified buffers (nord theme only)
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        if vim.g.colors_name == 'nord' then
          vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = '#ffcc02', bg = '#4c566a', bold = true })
          vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = '#ffcc02', bg = '#282a36' })
          vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = '#ffcc02' })
        end
      end,
    })
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
