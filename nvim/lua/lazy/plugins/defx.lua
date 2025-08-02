-- File explorer plugin
return {
  'Shougo/defx.nvim',
  dependencies = {
    'kristijanhusak/defx-icons',
    'kristijanhusak/defx-git',
  },
  keys = {
    { '<C-n>', '<cmd>Defx<cr>', desc = 'Open Defx' },
    { '<Leader><C-n>', '<cmd>Defx `expand("%:p:h")` -search=`expand("%:p")`<cr>', desc = 'Open Defx current file' },
  },
  config = function()
    -- Defx custom options
    vim.fn['defx#custom#option']('_', {
      show_ignored_files = 1,
      buffer_name = 'exlorer',
      toggle = 1,
      resume = 1,
      columns = 'indent:git:space:icons:space:space:filename:size:space:time:format',
    })

    -- Time format
    vim.fn['defx#custom#column']('time', 'format', '20%y/%m/%d %H:%M')

    -- Defx key mappings
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'defx',
      callback = function()
        local opts = { buffer = true, silent = true, expr = true }
        local keymap = vim.keymap.set
        
        -- File operations
        keymap('n', '<CR>', 'defx#do_action("open")', opts)
        keymap('n', 'c', 'defx#do_action("copy")', opts)
        keymap('n', 'm', 'defx#do_action("move")', opts)
        keymap('n', 'p', 'defx#do_action("paste")', opts)
        keymap('n', 'l', 'defx#do_action("open")', opts)
        keymap('n', 'v', 'defx#do_action("open", "vsplit")', opts)
        keymap('n', 'P', 'defx#do_action("preview")', opts)
        keymap('n', 'o', 'defx#do_action("open_tree", "toggle")', opts)
        
        -- Create operations
        keymap('n', 'K', 'defx#do_action("new_directory")', opts)
        keymap('n', 'N', 'defx#do_action("new_multiple_files")', opts)
        
        -- View operations
        keymap('n', 'C', 'defx#do_action("toggle_columns", "mark:indent:icon:filename:type:size:time")', opts)
        keymap('n', 'S', 'defx#do_action("toggle_sort", "time")', opts)
        
        -- Edit operations
        keymap('n', 'd', 'defx#do_action("remove")', opts)
        keymap('n', 'r', 'defx#do_action("rename")', opts)
        keymap('n', '!', 'defx#do_action("execute_command")', opts)
        keymap('n', 'x', 'defx#do_action("execute_system")', opts)
        keymap('n', 'yy', 'defx#do_action("yank_path")', opts)
        
        -- Navigation
        keymap('n', '.', 'defx#do_action("toggle_ignored_files")', opts)
        keymap('n', ';', 'defx#do_action("repeat")', opts)
        keymap('n', 'h', 'defx#do_action("cd", [".."])', opts)
        keymap('n', '~', 'defx#do_action("cd")', opts)
        keymap('n', 'q', 'defx#do_action("quit")', opts)
        keymap('n', '<C-n>', 'defx#do_action("quit")', opts)
        
        -- Selection
        keymap('n', '<Space><Space>', 'defx#do_action("toggle_select") . "j"', opts)
        keymap('n', '*', 'defx#do_action("toggle_select_all")', opts)
        
        -- Movement
        keymap('n', 'j', 'line(".") == line("$") ? "gg" : "j"', opts)
        keymap('n', 'k', 'line(".") == 1 ? "G" : "k"', opts)
        
        -- Utility
        keymap('n', '<C-l>', 'defx#do_action("redraw")', opts)
        keymap('n', '<C-g>', 'defx#do_action("print")', opts)
        keymap('n', 'cd', 'defx#do_action("cd", input("Please input change directory: ", "", "file"))', opts)
        keymap('n', 'C', 'defx#do_action("change_vim_cwd")', opts)
        
        -- Help
        vim.keymap.set('n', '?', function()
          vim.cmd('split ' .. vim.g.ROOT_DIR .. '/lua/lazy/plugins/defx.lua')
        end, { buffer = true, silent = true })
      end,
    })

    -- Auto refresh on file changes
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
      callback = function()
        vim.fn['defx#redraw']()
      end,
    })
  end,
}