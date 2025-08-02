-- Status line plugin
return {
  'vim-airline/vim-airline',
  dependencies = { 'vim-airline/vim-airline-themes' },
  config = function()
    -- Enable tabline
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#branch#enabled'] = 1
    vim.g['airline#extensions#wordcount#enabled'] = 0
    
    -- Layout configuration
    vim.g['airline#extensions#default#layout'] = {{'a', 'c'}, {'x', 'y'}}
    vim.g.airline_section_c = '%t'
    vim.g.airline_section_x = '%{&filetype}'
    vim.g['airline#extensions#default#section_truncate_width'] = vim.empty_dict()
    vim.g['airline#extensions#whitespace#enabled'] = 1
    
    -- Key mappings
    vim.keymap.set('n', '<C-e>', '<Plug>AirlineSelectPrevTab', { silent = true })
    vim.keymap.set('n', '<C-y>', '<Plug>AirlineSelectNextTab', { silent = true })
  end,
}
