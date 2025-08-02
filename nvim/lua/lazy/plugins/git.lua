-- Git integration plugins
return {
  -- Git commands
  'tpope/vim-fugitive',

  -- Git gutter
  {
    'airblade/vim-gitgutter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.keymap.set('n', '<Leader>h', ':GitGutterLineHighlightsToggle<CR>', { silent = true })
      vim.opt.updatetime = 100
    end,
  },

  -- Git diff viewer
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffOpen', 'DiffClose' },
    config = function()
      local diff_close_key = 'q'
      
      local function diff_open()
        vim.cmd('DiffviewOpen')
        vim.keymap.set('n', diff_close_key, ':DiffClose<CR>', { silent = true })
      end
      
      local function diff_close()
        vim.cmd('DiffviewClose')
        pcall(vim.keymap.del, 'n', diff_close_key)
      end
      
      vim.api.nvim_create_user_command('DiffOpen', diff_open, {})
      vim.api.nvim_create_user_command('DiffClose', diff_close, {})
    end,
  },

  -- Git conflict resolution
  {
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
  },
}