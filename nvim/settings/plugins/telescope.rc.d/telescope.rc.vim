lua << EOF
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    winblend = 30,
    path_display={ truncate = 1 },
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
require("telescope").load_extension("live_grep_args")
EOF

nnoremap <Leader>f <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <Leader>o <cmd>lua require('telescope').extensions.frecency.frecency()<cr>
" nnoremap <Leader>g <cmd>lua require('telescope.builtin').live_grep({hidden=true})<cr>
nnoremap <Leader>g <cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nnoremap <Leader>b <cmd>lua require('telescope.builtin').buffers({hidden=true})<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Leader>* <cmd>lua require('telescope.builtin').grep_string()<cr>

" telescope highlight groups from lua code
" local highlights = {
"   -- Sets the highlight for selected items within the picker.
"   TelescopeSelection = { default = true, link = "Visual" },
"   TelescopeSelectionCaret = { default = true, link = "TelescopeSelection" },
"   TelescopeMultiSelection = { default = true, link = "Type" },
"   TelescopeMultiIcon = { default = true, link = "Identifier" },
"
"   -- "Normal" in the floating windows created by telescope.
"   TelescopeNormal = { default = true, link = "Normal" },
"   TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
"   TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
"   TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },
"
"   -- Border highlight groups.
"   --   Use TelescopeBorder to override the default.
"   --   Otherwise set them specifically
"   TelescopeBorder = { default = true, link = "TelescopeNormal" },
"   TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
"   TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
"   TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
"
"   -- Title highlight groups.
"   --   Use TelescopeTitle to override the default.
"   --   Otherwise set them specifically
"   TelescopeTitle = { default = true, link = "TelescopeBorder" },
"   TelescopePromptTitle = { default = true, link = "TelescopeTitle" },
"   TelescopeResultsTitle = { default = true, link = "TelescopeTitle" },
"   TelescopePreviewTitle = { default = true, link = "TelescopeTitle" },
"
"   TelescopePromptCounter = { default = true, link = "NonText" },
"
"   -- Used for highlighting characters that you match.
"   TelescopeMatching = { default = true, link = "Special" },
"
"   -- Used for the prompt prefix
"   TelescopePromptPrefix = { default = true, link = "Identifier" },
"
"   -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
"   TelescopePreviewLine = { default = true, link = "Visual" },
"   TelescopePreviewMatch = { default = true, link = "Search" },
"
"   TelescopePreviewPipe = { default = true, link = "Constant" },
"   TelescopePreviewCharDev = { default = true, link = "Constant" },
"   TelescopePreviewDirectory = { default = true, link = "Directory" },
"   TelescopePreviewBlock = { default = true, link = "Constant" },
"   TelescopePreviewLink = { default = true, link = "Special" },
"   TelescopePreviewSocket = { default = true, link = "Statement" },
"   TelescopePreviewRead = { default = true, link = "Constant" },
"   TelescopePreviewWrite = { default = true, link = "Statement" },
"   TelescopePreviewExecute = { default = true, link = "String" },
"   TelescopePreviewHyphen = { default = true, link = "NonText" },
"   TelescopePreviewSticky = { default = true, link = "Keyword" },
"   TelescopePreviewSize = { default = true, link = "String" },
"   TelescopePreviewUser = { default = true, link = "Constant" },
"   TelescopePreviewGroup = { default = true, link = "Constant" },
"   TelescopePreviewDate = { default = true, link = "Directory" },
"   TelescopePreviewMessage = { default = true, link = "TelescopePreviewNormal" },
"   TelescopePreviewMessageFillchar = { default = true, link = "TelescopePreviewMessage" },
"
"   -- Used for Picker specific Results highlighting
"   TelescopeResultsClass = { default = true, link = "Function" },
"   TelescopeResultsConstant = { default = true, link = "Constant" },
"   TelescopeResultsField = { default = true, link = "Function" },
"   TelescopeResultsFunction = { default = true, link = "Function" },
"   TelescopeResultsMethod = { default = true, link = "Method" },
"   TelescopeResultsOperator = { default = true, link = "Operator" },
"   TelescopeResultsStruct = { default = true, link = "Struct" },
"   TelescopeResultsVariable = { default = true, link = "SpecialChar" },
"
"   TelescopeResultsLineNr = { default = true, link = "LineNr" },
"   TelescopeResultsIdentifier = { default = true, link = "Identifier" },
"   TelescopeResultsNumber = { default = true, link = "Number" },
"   TelescopeResultsComment = { default = true, link = "Comment" },
"   TelescopeResultsSpecialComment = { default = true, link = "SpecialComment" },
"   TelescopeResultsFileIcon = { default = true, link = "Normal" },
"
"   -- Used for git status Results highlighting
"   TelescopeResultsDiffChange = { default = true, link = "DiffChange" },
"   TelescopeResultsDiffAdd = { default = true, link = "DiffAdd" },
"   TelescopeResultsDiffDelete = { default = true, link = "DiffDelete" },
"   TelescopeResultsDiffUntracked = { default = true, link = "NonText" },
" }
