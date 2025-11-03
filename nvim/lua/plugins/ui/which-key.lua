-- Which-key: keybinding help popup
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    -- Set custom highlight groups for which-key window
    local function set_which_key_highlights()
      -- Use NormalFloat background for which-key window
      vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'Normal' })
      -- Customize border color (adjust this color to match your theme)
      vim.api.nvim_set_hl(0, 'WhichKeyBorder', { link = 'FloatBorder' })
    end

    -- Apply highlights initially
    set_which_key_highlights()

    -- Reapply highlights when colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = set_which_key_highlights,
      desc = 'Update which-key highlights after colorscheme change',
    })

    require('which-key').setup({
      -- Delay before showing the popup
      delay = function(ctx)
        return ctx.plugin and 0 or 500
      end,
      -- Show warning when issues detected with mappings
      notify = true,
      -- Plugins
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- Window options
      win = {
        no_overlap = true, -- don't allow the popup to overlap with the cursor
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = 'center',
        zindex = 1000,
        border = 'rounded', -- Border style: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
      },
      -- Layout
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      -- Keys for scrolling inside popup
      keys = {
        scroll_down = '<c-f>', -- binding to scroll down inside the popup
        scroll_up = '<c-b>', -- binding to scroll up inside the popup
      },
      -- Sorting
      sort = { 'local', 'order', 'group', 'alphanum', 'mod' },
    })

  end,
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
