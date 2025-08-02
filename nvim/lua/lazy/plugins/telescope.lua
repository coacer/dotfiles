-- Fuzzy finder plugin
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'tami5/sqlite.lua',
  },
  cmd = 'Telescope',
  keys = {
    { '<Leader>f', '<cmd>lua require("telescope.builtin").find_files({hidden=true})<cr>', desc = 'Find files' },
    { '<Leader>o', '<cmd>lua require("telescope").extensions.frecency.frecency()<cr>', desc = 'Frecency' },
    { '<Leader>g', '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', desc = 'Live grep' },
    { '<Leader>b', '<cmd>lua require("telescope.builtin").buffers({hidden=true})<cr>', desc = 'Buffers' },
    { '<C-h>', '<cmd>lua require("telescope.builtin").help_tags()<cr>', desc = 'Help tags' },
    { '<Leader>*', '<cmd>lua require("telescope.builtin").grep_string()<cr>', desc = 'Grep string' },
  },
  config = function()
    local actions = require("telescope.actions")
    
    require('telescope').setup({
      defaults = {
        winblend = 30,
        path_display = { truncate = 1 },
        mappings = {
          n = {
            ["<C-d>"] = actions.close,
          },
          i = {
            ["<C-l>"] = false,
            ["<C-u>"] = false,
            ["<C-a>"] = false,
            ["<C-d>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-y>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      },
      extensions = {
        frecency = {
          workspaces = {
            ["nvim"] = vim.g.ROOT_DIR,
          }
        },
      }
    })
    
    -- Load extensions
    require("telescope").load_extension("live_grep_args")
  end,
}