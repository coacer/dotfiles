-- Flutter development
return {
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
}
