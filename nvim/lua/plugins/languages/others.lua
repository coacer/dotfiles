-- Other language support
return {
  -- TOML
  { 'cespare/vim-toml', ft = { 'toml' } },

  -- Go
  { 'mattn/vim-goimports', ft = { 'go' } },

  -- Dart/Flutter
  {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      vim.g.dart_format_on_save = true
    end,
  },
  {
    'thosakwe/vim-flutter',
    ft = { 'dart' },
    config = function()
      -- Set default flutter option if not exists
      if not vim.g.flutter_option then
        vim.g.flutter_option = ''
      end

      -- Flutter commands
      vim.keymap.set('n', '<Leader>DD', '<Cmd>FlutterRun ' .. vim.g.flutter_option .. '<CR>')
      vim.keymap.set('n', '<Leader>DQ', '<Cmd>FlutterQuit<CR>')
      vim.keymap.set('n', '<Leader>DR', '<Cmd>FlutterHotRestart<CR>')
    end,
  },

  -- Swift
  'keith/swift.vim',

  -- CoffeeScript
  { 'kchmck/vim-coffee-script', ft = { 'coffee' } },

  -- Terraform
  { 'hashivim/vim-terraform', ft = { 'terraform' } },

  -- Protocol Buffers
  { 'uarun/vim-protobuf', ft = { 'proto' } },

  -- GraphQL
  {
    'jparise/vim-graphql',
    ft = { 'graphql' },
    config = function()
      vim.g.graphql_javascript_tags = { '' }
    end,
  },

  -- Rails
  'tpope/vim-rails',
}
