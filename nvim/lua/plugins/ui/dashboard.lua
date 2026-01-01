-- Dashboard
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local ascii = require('ascii')
    local devicons = require('nvim-web-devicons')
    local header = ascii.art.text.neovim.sharp
    -- 上下に空行を追加
    table.insert(header, 1, '')
    table.insert(header, 1, '')
    table.insert(header, '')
    table.insert(header, '')

    -- nvim-web-deviconsからアイコンを取得
    local function get_icon(name)
      local icon = devicons.get_icon(name)
      return (icon or '') .. '  '
    end

    -- ハイライト設定
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6b8bae' })
    vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#6b8bae' })
    vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#6b8bae' })
    vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#FFFFFF' })

    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = header,
        center = {
          {
            icon = "  ",
            desc = 'Find File                                         ',
            key = 'f',
            action = 'Telescope find_files',
          },
          {
            icon = "  ",
            desc = 'Find Word                                         ',
            key = 'g',
            action = 'Telescope live_grep',
          },
          {
            icon = "  ",
            desc = 'Recent Files                                      ',
            key = 'r',
            action = 'Telescope oldfiles',
          },
          {
            icon = "  ",
            desc = 'New File                                          ',
            key = 'n',
            action = 'enew',
          },
          {
            icon = "  ",
            desc = 'Config                                            ',
            key = 'c',
            action = 'edit ~/.config/nvim/init.lua',
          },
          {
            icon = "  ",
            desc = 'Quit                                              ',
            key = 'q',
            action = 'quit',
          },
        },
        vertical_center = true,
      },
    }
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
  }
}
