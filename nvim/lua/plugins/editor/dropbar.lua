-- Winbar for navigation
return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    require('dropbar').setup({
      bar = {
        sources = function(buf, _)
          return {
            require('dropbar.sources').path
          }
        end
      }
    })

    -- dropbarの背景色をColorScheme後に設定 (nord theme only)
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        if vim.g.colors_name == 'nord' then
          -- 通常時の背景色
          vim.api.nvim_set_hl(0, 'WinBar', { bg = '#5b6b81' })
          vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#5b6b81' })
          -- 選択時やメニューの背景色
          vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = '#2e3440' })
          vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#2e3440' })
          vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = '#434c5e' })
        end
      end,
    })
  end,
}
