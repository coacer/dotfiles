return {
  "stevearc/oil.nvim",
  -- Lazy loading is not recommended for oil.nvim
  lazy = false,
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  opts = {
    -- Set oil as the default file explorer
    default_file_explorer = true,
    -- Display columns
    columns = {
      "icon",
    },
    -- Use system trash instead of permanent deletion
    delete_to_trash = true,
    -- Skip confirmation for simple operations
    skip_confirm_for_simple_edits = false,
    -- Watch for external changes and reload buffer
    watch_for_changes = false,
    -- View options
    view_options = {
      show_hidden = true,
    },
    -- Keymaps for oil buffer
    keymaps = {
      ["g?"] = "actions.show_help",
      ["l"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-n>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["h"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    -- Configuration for floating window
    float = {
      padding = 2,
      max_width = 0.6,
      max_height = 0.7,
      border = "rounded",
      win_options = {
        winblend = 20,
      },
    },
    -- Configuration for preview window
    preview = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    -- Configuration for progress window
    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- Keymap to open oil in floating window
    vim.keymap.set("n", "<C-n>", "<CMD>Oil . --float<CR>", { desc = "Open cwd in oil floating window" })
    vim.keymap.set("n", "<Leader><C-n>", "<CMD>Oil --float<CR>", { desc = "Open current file directory in oil floating window" })
  end,
}
