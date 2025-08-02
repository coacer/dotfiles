-- Editor enhancement plugins
return {
  -- Text editing
  'tomtom/tcomment_vim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',
  'tpope/vim-endwise',

  -- Text alignment
  {
    'junegunn/vim-easy-align',
    keys = { 'ga', { 'ga', mode = 'x' } },
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
    end,
  },

  -- Navigation
  {
    'easymotion/vim-easymotion',
    keys = { '<Leader>j', '<Leader><Leader>' },
    config = function()
      vim.keymap.set('', '<Leader>j', '<Plug>(easymotion-bd-w)')
      vim.g['easymotion#is_active'] = 0
      
      -- Disable Coc during EasyMotion
      vim.api.nvim_create_augroup('EasyMotionCoc', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        group = 'EasyMotionCoc',
        pattern = 'EasyMotionPromptBegin',
        command = 'silent! CocDisable',
      })
      vim.api.nvim_create_autocmd('User', {
        group = 'EasyMotionCoc',
        pattern = 'EasyMotionPromptEnd',
        command = 'silent! CocEnable',
      })
    end,
  },

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

  -- Undo tree
  {
    'sjl/gundo.vim',
    cmd = 'GundoToggle',
    keys = '<F1>',
    config = function()
      -- Use python3 for gundo (default is python2.4)
      vim.g.gundo_prefer_python3 = 1
      vim.keymap.set('n', '<F1>', ':GundoToggle<CR>')
    end,
  },

  -- Indent guides
  {
    'nathanaelkane/vim-indent-guides',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
      vim.g.indent_guides_auto_colors = 0
    end,
  },

  -- Window resizer
  {
    'simeji/winresizer',
    keys = '<C-U>',
    config = function()
      vim.g.winresizer_start_key = '<C-U>'
      -- Resize amounts
      vim.g.winresizer_vert_resize = 3
      vim.g.winresizer_horiz_resize = 1
    end,
  },

  -- Fuzzy finder (fzf)
  {
    'junegunn/fzf.vim',
    dependencies = { { dir = '/opt/homebrew/opt/fzf' } },
    cmd = { 'Files', 'Buffers', 'Rg', 'History', 'GGrep' },
    config = function()
      -- Layout configuration
      vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
      
      -- GGrep command
      vim.api.nvim_create_user_command('GGrep', function(opts)
        local args = opts.args
        vim.fn['fzf#vim#grep'](
          'git grep --line-number ' .. vim.fn.shellescape(args), 0,
          vim.fn['fzf#vim#with_preview']({
            dir = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
          }), opts.bang
        )
      end, { bang = true, nargs = '*' })
    end,
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local neoscroll = require('neoscroll')
      
      neoscroll.setup({
        mappings = {'<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
      })
      
      -- Scroll mappings
      local map = function(lhs, lines, opts)
        vim.keymap.set('n', lhs, function()
          neoscroll.scroll(lines, opts)
        end, { silent = true })
      end
      
      map('<C-b>', -vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 125 })
      map('<C-f>', vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 125 })
      
      -- z-series mappings
      vim.keymap.set('n', 'zz', function()
        local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
        require('neoscroll').zz({
          half_win_duration = half_win,
          duration = 75
        })
      end, { silent = true })
      
      vim.keymap.set('n', 'zt', function()
        local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
        require('neoscroll').zt({
          half_win_duration = half_win,
          duration = 100
        })
      end, { silent = true })
      
      vim.keymap.set('n', 'zb', function()
        local half_win = math.floor(vim.api.nvim_win_get_height(0) / 2)
        require('neoscroll').zb({
          half_win_duration = half_win,
          duration = 100
        })
      end, { silent = true })
    end,
  },

  -- Focus mode
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo',
  },

  -- EditorConfig
  'editorconfig/editorconfig-vim',
}
