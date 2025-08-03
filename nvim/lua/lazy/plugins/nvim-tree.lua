-- File explorer plugin
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    { '<Leader><C-n>', '<cmd>NvimTreeFindFile<cr>', desc = 'Find current file in NvimTree' },
  },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        width = 40,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        
        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)
        
        -- Custom mappings matching defx
        -- File operations
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'P', api.node.open.preview, opts('Open Preview'))
        vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
        
        -- Create operations
        vim.keymap.set('n', 'K', function()
          api.fs.create_dir()
        end, opts('Create Directory'))
        vim.keymap.set('n', 'N', function()
          api.fs.create()
        end, opts('Create File'))
        
        -- Edit operations
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
        vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
        vim.keymap.set('n', 'm', api.fs.cut, opts('Cut'))
        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        vim.keymap.set('n', 'yy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
        
        -- Navigation
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', '~', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
        vim.keymap.set('n', '<C-n>', api.tree.close, opts('Close'))
        
        -- Selection
        vim.keymap.set('n', '<Space><Space>', api.node.navigate.sibling.next, opts('Next Sibling'))
        
        -- View operations
        vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
        vim.keymap.set('n', 'C', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'S', function()
          -- Toggle sort by time (nvim-tree doesn't have exact equivalent, so refresh)
          api.tree.reload()
        end, opts('Refresh'))
        
        -- Utility
        vim.keymap.set('n', '<C-l>', api.tree.reload, opts('Refresh'))
        vim.keymap.set('n', '<C-g>', function()
          local node = api.tree.get_node_under_cursor()
          if node then
            print(node.absolute_path)
          end
        end, opts('Print Path'))
        
        -- Help
        vim.keymap.set('n', '?', function()
          vim.cmd('split ' .. vim.g.ROOT_DIR .. '/lua/lazy/plugins/nvim-tree.lua')
        end, opts('Help'))
      end,
    })
    
    -- Auto refresh on file changes
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
      callback = function()
        require('nvim-tree.api').tree.reload()
      end,
    })
  end,
}
