-- Lazy loading plugins (converted from dein_lazy.toml)
return {
  -- Emmet for web development
  {
    'mattn/emmet-vim',
    ft = { 'html', 'eruby', 'javascriptreact', 'tsx', 'php', 'vue' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/emmet-vim.rc.vim')
    end,
  },

  -- JavaScript ES6 syntax
  {
    'othree/yajs.vim',
    ft = { 'javascript', 'vue', 'javascriptreact' },
  },

  -- CoffeeScript syntax
  {
    'kchmck/vim-coffee-script',
    ft = { 'coffee' },
  },

  -- TOML syntax
  {
    'cespare/vim-toml',
    ft = { 'toml' },
  },

  -- Vue.js syntax
  {
    'posva/vim-vue',
    ft = { 'vue' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-vue.rc.vim')
    end,
  },

  -- PHP Blade template syntax
  {
    'jwalton512/vim-blade',
    ft = { 'blade' },
  },

  -- TypeScript syntax
  {
    'leafgarland/typescript-vim',
    ft = { 'typescript', 'tsx' },
  },

  -- JSX syntax
  {
    'maxmellon/vim-jsx-pretty',
    ft = { 'javascript', 'javascriptreact', 'tsx' },
  },

  -- TSX syntax
  {
    'ianks/vim-tsx',
    ft = { 'tsx' },
  },

  -- PHP debugging
  {
    'joonty/vdebug',
    ft = { 'php' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vdebug.rc.vim')
    end,
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'pandoc.markdown', 'rmd' },
    build = 'sh -c "cd app & yarn install"',
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/markdown-preview.rc.vim')
    end,
  },

  -- Terraform syntax and commands
  {
    'hashivim/vim-terraform',
    ft = { 'terraform' },
  },

  -- Go imports formatter
  {
    'mattn/vim-goimports',
    ft = { 'go' },
  },

  -- Protocol Buffers syntax
  {
    'uarun/vim-protobuf',
    ft = { 'proto' },
  },

  -- Dart language support
  {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/dart-vim-plugin.rc.vim')
    end,
  },

  -- Flutter support
  {
    'thosakwe/vim-flutter',
    ft = { 'dart' },
    config = function()
      vim.cmd('source ' .. vim.g.ROOT_DIR .. '/settings/plugins/vim-flutter.rc.vim')
    end,
  },
}