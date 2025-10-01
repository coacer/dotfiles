-- Snippets
return {
  'Shougo/neosnippet-snippets',
  {
    'Shougo/neosnippet',
    dependencies = { 'Shougo/neosnippet-snippets' },
    event = 'InsertEnter',
    config = function()
      -- Key mappings
      vim.keymap.set('i', '<C-k>', '<Plug>(neosnippet_expand_or_jump)')
      vim.keymap.set('s', '<C-k>', '<Plug>(neosnippet_expand_or_jump)')
      vim.keymap.set('x', '<C-k>', '<Plug>(neosnippet_expand_target)')

      -- Conceal settings
      if vim.fn.has('conceal') then
        vim.opt.conceallevel = 2
        vim.opt.concealcursor = 'niv'
      end

      -- Custom snippets directory
      vim.g['neosnippet#snippets_directory'] = vim.g.ROOT_DIR .. '/settings/plugins/neosnippet.rc.d/snippets'
    end,
  },
}
