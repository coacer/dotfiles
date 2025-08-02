-- Editor enhancement plugins
return {
  -- Text editing
  'tomtom/tcomment_vim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({
        disable_in_macro = false,
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        enable_bracket_in_quote = true,
        enable_abbr = false,
        break_undo = true,
        check_ts = true,
        map_bs = true,
        map_c_h = false,
        map_c_w = false,
      })
    end,
  },
  'tpope/vim-endwise',

  -- TreeSitter for enhanced syntax highlighting and parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'javascript',
          'typescript',
          'tsx',
          'html',
          'css',
          'scss',
          'json',
          'lua',
          'vim',
          'vimdoc',
          'markdown',
          'yaml',
          'toml',
          'bash',
          'python',
          'go',
          'rust',
          'php',
          'vue',
          'dart',
          'swift',
          'ruby',
          'java',
          'kotlin',
          'scala',
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = '<C-s>',
            node_decremental = '<C-backspace>',
          },
        },
      })
    end,
  },

  -- TreeSitter context for showing context at the top
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
      
      -- Custom highlight for TreesitterContext background (nord theme only)
      if vim.g.colors_name == 'nord' then
        vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = '#3c455c', blend = 0 })
        vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = '#3c455c', blend = 0 })
      end
    end,
  },

  -- Code chunk highlighting
  {
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
  },

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

  -- Buffer tabs
  {
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
            vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = '#ffcc02', bg = '#44475a', bold = true })
            vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = '#ffcc02', bg = '#282a36' })
            vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = '#ff9580', bg = '#21222c' })
          end
        end,
      })
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- Winbar for navigation
  {
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
            vim.api.nvim_set_hl(0, 'WinBar', { bg = '#2e3440' })
            vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#2e3440' })
            -- 選択時やメニューの背景色
            vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = '#2e3440' })
            vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#2e3440' })
            vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = '#434c5e' })
          end
        end,
      })
      
      -- 初回設定 (nord theme only)
      if vim.g.colors_name == 'nord' then
        vim.api.nvim_set_hl(0, 'WinBar', { bg = '#2e3440' })
        vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#2e3440' })
        vim.api.nvim_set_hl(0, 'DropBarCurrentContext', { bg = '#2e3440' })
        vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { bg = '#2e3440' })
        vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { bg = '#434c5e' })
      end
    end,
  },

}
