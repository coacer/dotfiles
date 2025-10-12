-- Emmet for HTML/CSS
return {
  'mattn/emmet-vim',
  ft = { 'html', 'eruby', 'javascriptreact', 'tsx', 'php', 'vue' },
  config = function()
    vim.g.user_emmet_leader_key = '<C-j>'
    vim.g.user_emmet_mode = 'i' -- only enable insert mode functions
  end,
}
