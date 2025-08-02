-- Normal loading plugins (converted from dein.toml)
return {
  -- Plugin manager
  'folke/lazy.nvim',

  -- Colorschemes
  'cocopon/iceberg.vim',
  'jonathanfilip/vim-lucius',
  'jdkanani/vim-material-theme',
  'gosukiwi/vim-atom-dark',
  'arcticicestudio/nord-vim',
  'w0ng/vim-hybrid',

  -- Comment plugin
  'tomtom/tcomment_vim',

  -- Status line
  {
    'vim-airline/vim-airline',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-airline.rc.vim')
    end,
  },
  'vim-airline/vim-airline-themes',

  -- Window resizer
  {
    'simeji/winresizer',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/winresizer.rc.vim')
    end,
  },

  -- Git integration
  'tpope/vim-fugitive',
  {
    'airblade/vim-gitgutter',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-gitgutter.rc.vim')
    end,
  },

  -- Text objects and editing
  'tpope/vim-surround',
  'tpope/vim-repeat',

  -- Rails support
  'tpope/vim-rails',

  -- Japanese vim help
  'vim-jp/vimdoc-ja',

  -- Indent guides
  {
    'nathanaelkane/vim-indent-guides',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-indent-guides.rc.vim')
    end,
  },

  -- Icons
  'ryanoasis/vim-devicons',
  'kristijanhusak/defx-icons',
  'kristijanhusak/defx-git',
  'kyazdani42/nvim-web-devicons',
  {
    'tiagofumo/vim-nerdtree-syntax-highlight',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-nerdtree-syntax-highlight.rc.vim')
    end,
  },

  -- Editor config
  'editorconfig/editorconfig-vim',

  -- Undo tree
  {
    'sjl/gundo.vim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/gundo.rc.vim')
    end,
  },

  -- Fuzzy finder
  {
    'junegunn/fzf.vim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/fzf.rc.vim')
    end,
  },
  { dir = '/opt/homebrew/opt/fzf' },

  -- LSP (TODO: migrate to builtin LSP)
  {
    'neoclide/coc.nvim',
    branch = 'release',
    build = false,
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/coc.rc.d/init.vim')
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/coc.rc.d/extensions.vim')
    end,
  },

  -- Snippets
  'Shougo/neosnippet-snippets',
  {
    'Shougo/neosnippet',
    dependencies = { 'Shougo/neosnippet-snippets' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/neosnippet.rc.d/init.vim')
    end,
  },

  -- Unite and extensions
  'Shougo/unite.vim',
  {
    'ujihisa/unite-colorscheme',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/unite-colorscheme.rc.vim')
    end,
  },

  -- Auto pairs
  'jiangmiao/auto-pairs',
  'tpope/vim-endwise',

  -- Focus mode
  'junegunn/goyo.vim',

  -- Text alignment
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-easy-align.rc.vim')
    end,
  },

  -- Yank highlighting
  {
    'machakann/vim-highlightedyank',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-highlightedyank.rc.vim')
    end,
  },

  -- File explorer
  {
    'Shougo/defx.nvim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/defx.rc.vim')
    end,
  },

  -- GraphQL syntax
  {
    'jparise/vim-graphql',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-graphql.rc.vim')
    end,
  },

  -- Debugger (TODO: migrate to nvim-dap)
  {
    'puremourning/vimspector',
    build = './install_gadget.py --basedir $HOME/.config/nvim/settings/plugins/vimspector.rc.d',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vimspector.rc.d/init.vim')
    end,
  },

  -- Cursor movement
  {
    'easymotion/vim-easymotion',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-easymotion.rc.vim')
    end,
  },

  -- Lua utilities
  'nvim-lua/plenary.nvim',

  -- SQL
  {
    'vim-scripts/dbext.vim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/dbext.rc.d/dbext.rc.vim')
    end,
  },

  -- Telescope finder
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/telescope.rc.d/telescope.rc.vim')
    end,
  },

  -- Notifications
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/nvim-notify.rc.vim')
    end,
  },

  -- Telescope extensions
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'tami5/sqlite.lua' },
  },
  'tami5/sqlite.lua',
  'nvim-telescope/telescope-live-grep-args.nvim',

  -- UI enhancements
  {
    'petertriho/nvim-scrollbar',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/nvim-scrollbar.rc.vim')
    end,
  },
  'kevinhwang91/nvim-hlslens',
  {
    'haya14busa/vim-asterisk',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-asterisk.rc.vim')
    end,
  },
  'kevinhwang91/nvim-bqf',

  -- Git diff
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/diffview.rc.vim')
    end,
  },

  -- Git conflict
  {
    'akinsho/git-conflict.nvim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/git-conflict.rc.vim')
    end,
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/neoscroll.rc.vim')
    end,
  },

  -- Language support
  'keith/swift.vim',

  -- GitHub Copilot
  'github/copilot.vim',
}