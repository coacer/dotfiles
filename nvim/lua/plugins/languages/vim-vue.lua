-- Vue.js syntax
return {
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
}
