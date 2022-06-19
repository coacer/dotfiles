lua << EOF
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    winblend = 30,
    mappings = {
      n = {
        ["<C-d>"] = actions.close,
      },
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
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
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    frecency = {
      workspaces = {
        ["nvim"]    = vim.g.ROOT_DIR,
      }
    },
  }
}
EOF

nnoremap <Leader>f <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <Leader>o <cmd>lua require('telescope').extensions.frecency.frecency()<cr>
nnoremap <Leader>g <cmd>lua require('telescope.builtin').live_grep({hidden=true})<cr>
nnoremap <Leader>b <cmd>lua require('telescope.builtin').buffers({hidden=true})<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').help_tags()<cr>
