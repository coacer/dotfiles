-- Code chunk highlighting
return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('hlchunk').setup({
      chunk = {
        enable = true,
        priority = 15,
        notify = true,
        -- style = {
        --   { fg = '#806d9c' },
        --   { fg = '#c21f30' }, -- This fg is used to highlight wrong chunk
        -- },
      },
      indent = {
        enable = false, -- Let treesitter handle indentation
      },
      line_num = {
        enable = true,
      },
      blank = {
        enable = true,
      }
    })
  end,
}
