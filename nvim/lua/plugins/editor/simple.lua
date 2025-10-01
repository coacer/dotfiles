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

  -- Search enhancement
  {
    'haya14busa/vim-asterisk',
    keys = { '*', '#', 'g*', 'g#' },
    config = function()
      vim.g['asterisk#keeppos'] = 1

      vim.keymap.set('', '*', '<Plug>(asterisk-z*)')
      vim.keymap.set('', '#', '<Plug>(asterisk-z#)')
      vim.keymap.set('', 'g*', '<Plug>(asterisk-gz*)')
      vim.keymap.set('', 'g#', '<Plug>(asterisk-gz#)')
    end,
  },

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

  -- Focus mode
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo',
  },

  -- EditorConfig
  'editorconfig/editorconfig-vim',

  -- Color picker and colorizer
  {
    'uga-rosa/ccc.nvim',
    cmd = { 'CccPick', 'CccConvert', 'CccHighlighterEnable', 'CccHighlighterToggle' },
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
}
