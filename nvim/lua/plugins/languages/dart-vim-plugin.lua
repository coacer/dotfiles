-- Dart language support
return {
  'dart-lang/dart-vim-plugin',
  ft = { 'dart' },
  config = function()
    vim.g.dart_format_on_save = true
  end,
}
