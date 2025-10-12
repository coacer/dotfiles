-- Surround text objects
return {
  'tpope/vim-surround',
  config = function()
    -- Disable experimental insert mode mappings <c-g>s and <c-g>S
    vim.g.surround_no_insert_mappings = 1

    -- Explicitly unmap the insert mode keybindings as a fallback
    vim.schedule(function()
      pcall(vim.keymap.del, 'i', '<c-g>s')
      pcall(vim.keymap.del, 'i', '<c-g>S')
    end)
  end,
}
