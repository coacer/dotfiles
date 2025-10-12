-- Highlight yanked text
return {
  'machakann/vim-highlightedyank',
  event = 'TextYankPost',
  config = function()
    -- Highlight duration in milliseconds
    vim.g.highlightedyank_highlight_duration = 800
  end,
}
