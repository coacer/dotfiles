-- Simple editor plugins with minimal configuration
return {
  -- Text editing
  'tomtom/tcomment_vim',
  {
    'tpope/vim-surround',
    config = function()
      -- Disable experimental insert mode mappings <c-g>s and <c-g>S
      vim.g.surround_no_insert_mappings = 1

      -- Explicitly unmap the insert mode keybindings as a fallback
      vim.schedule(function()
        pcall(vim.keymap.del, 'i', '<c-g>s')
        pcall(vim.keymap.del, 'i', '<c-g>S')
      end)
    end,
  },
  'tpope/vim-repeat',
  'tpope/vim-endwise',

  -- Search lens
  'kevinhwang91/nvim-hlslens',

  -- Quickfix enhancement
  'kevinhwang91/nvim-bqf',

  -- Yank highlighting
  {
    'machakann/vim-highlightedyank',
    event = 'TextYankPost',
    config = function()
      -- Highlight duration in milliseconds
      vim.g.highlightedyank_highlight_duration = 800
    end,
  },
}
