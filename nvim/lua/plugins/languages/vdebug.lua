-- PHP debugging with Xdebug
return {
  'joonty/vdebug',
  ft = { 'php' },
  config = function()
    local vdebug_file = '.vdebug.conf.vim'

    -- Load config file if it exists
    if vim.fn.filereadable(vdebug_file) == 1 then
      vim.cmd('source ' .. vdebug_file)

      -- Configure vdebug options using loaded variables
      vim.g.vdebug_options = {
        port = vim.g.xdebug_port,
        timeout = 20,
        on_close = 'detach',
        break_on_open = 0,
        remote_path = "",
        local_path = "",
        debug_window_level = 0,
        debug_file_level = 0,
        debug_file = "",
        path_maps = {
          [vim.g.xdebug_guest_path] = vim.g.xdebug_host_path,
        },
        window_arrangement = { "DebuggerWatch", "DebuggerStack" }
      }

      -- Highlight settings
      vim.cmd('highlight DbgCurrentLine guibg=#774449')
      vim.cmd('highlight DbgCurrentSign guibg=#774449')
      vim.cmd('highlight DbgBreakptLine guibg=#395640')
      vim.cmd('highlight DbgBreakptSign guibg=#395640')

      -- Key mappings
      vim.keymap.set('n', '<Leader>x', '<Nop>')  -- Disable Leader+x
      vim.keymap.set('n', '<Leader>xx', '<F10>') -- Toggle breakpoint
      vim.keymap.set('n', '<Leader>xs', '<F5>')  -- Start debug
      vim.keymap.set('n', '<Leader>xd', '<F6>')  -- Stop debug
      vim.keymap.set('n', '<Leader>xj', '<F2>')  -- Step over
      vim.keymap.set('n', '<Leader>xl', '<F3>')  -- Step in
      vim.keymap.set('n', '<Leader>xh', '<F4>')  -- Step out
      vim.keymap.set('n', '<Leader>xe', '<F12>') -- Evaluate
    end
  end,
}
