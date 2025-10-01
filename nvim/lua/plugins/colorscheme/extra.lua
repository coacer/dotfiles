-- Additional colorschemes and utilities
return {
  -- Additional colorschemes
  'jonathanfilip/vim-lucius',
  'jdkanani/vim-material-theme',
  'gosukiwi/vim-atom-dark',
  {
    'arcticicestudio/nord-vim',
    priority = 1000,
  },
  'w0ng/vim-hybrid',

  -- Colorscheme utilities
  'Shougo/unite.vim',
  {
    'ujihisa/unite-colorscheme',
    dependencies = { 'Shougo/unite.vim' },
    cmd = { 'Unite', 'ColorSchemeSelect' },
    config = function()
      -- Colorscheme blacklist
      vim.g.unite_colorscheme_blacklist = {
        'blue', 'darkblue', 'delek', 'evening',
        'desert', 'elflord', 'koehler', 'morning',
        'murphy', 'pablo', 'peachpuff', 'ron',
        'slate', 'torte', 'zellner', 'industry', 'shine'
      }

      -- Create convenient command
      vim.api.nvim_create_user_command('ColorSchemeSelect', 'Unite colorscheme -auto-preview', {})
    end,
  },
}
