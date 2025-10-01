-- Web development languages
return {
  -- Emmet
  {
    'mattn/emmet-vim',
    ft = { 'html', 'eruby', 'javascriptreact', 'tsx', 'php', 'vue' },
    config = function()
      vim.g.user_emmet_leader_key = '<C-j>'
      vim.g.user_emmet_mode = 'i' -- only enable insert mode functions
    end,
  },

  -- Vue.js
  {
    'posva/vim-vue',
    ft = { 'vue' },
    config = function()
      -- Fix heavy operations
      vim.g.vue_disable_pre_processors = 1

      -- Syntax sync from start for Vue files
      vim.api.nvim_create_augroup('VimVue', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'VimVue',
        pattern = 'vue',
        command = 'syntax sync fromstart',
      })
    end,
  },
}
